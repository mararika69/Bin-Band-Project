import 'package:flutter/material.dart';
import '../controllers/schedule_controller.dart';

class SchedulePickupScreen extends StatefulWidget {
  @override
  _SchedulePickupScreenState createState() => _SchedulePickupScreenState();
}

class _SchedulePickupScreenState extends State<SchedulePickupScreen> {
  final PickupController _controller = PickupController();
  bool recurring = false;
  List<String> selectedWasteTypes = [];
  double estimatedWeight = 0.0;
  String selectedDate = DateTime.now().toIso8601String();

  void _submitPickupRequest() async {
    bool success = await _controller.createPickup(
      date: selectedDate,
      wasteTypes: selectedWasteTypes,
      estimateWeight: estimatedWeight,
      recurring: recurring,
    );

    if (success) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Pickup scheduled successfully!")),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to schedule pickup.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Schedule Pickup")),
      body: Column(
        children: [
          CheckboxListTile(
            title: Text("Repeat Weekly"),
            value: recurring,
            onChanged: (bool? value) {
              setState(() {
                recurring = value ?? false;
              });
            },
          ),
          ElevatedButton(
            onPressed: _submitPickupRequest,
            child: Text("Submit Pickup"),
          ),
        ],
      ),
    );
  }
}
