// static

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class SchedulePickupScreen extends StatefulWidget {
//   @override
//   _SchedulePickupScreenState createState() => _SchedulePickupScreenState();
// }

// class _SchedulePickupScreenState extends State<SchedulePickupScreen> {
//   @override
//   _SchedulePickupScreenState createState() => _SchedulePickupScreenState();
// }

// class _SchedulePickupScreenState extends State<SchedulePickupScreen> {
//   DateTime? selectedDate;
//   DateTime focusedDate = DateTime.now();
//   List<String> selectedWasteTypes = [];
//   String estimatedWeight = "";
//   bool recurringPickup = false;
//   bool showErrors = false;

//   final List<String> _wasteTypes = ["Plastic", "Metal", "Paper", "Glass"];
//   final ScheduleController _scheduleController = ScheduleController();

//   void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
//     setState(() {
//       selectedDate = selectedDay;
//       focusedDate = focusedDay;
//       showErrors = false; // Hide errors when user selects a date
//     });
//   }

//   Future<void> _schedulePickup() async {
//     setState(() {
//       showErrors = true; // Show errors if form is incomplete
//     });

//     if (selectedDate == null || selectedWasteTypes.isEmpty || estimatedWeight.isEmpty) {
//       return; // Stop if validation fails
//     }

//     try {
//       final weightValue = double.tryParse(
//         estimatedWeight.replaceAll(RegExp(r'[^0-9.]'), ''),
//       ) ?? 0.0;

//       await _scheduleController.createNewSchedule(
//         userId: "1",
//         date: selectedDate!.toIso8601String(),
//         wasteTypes: selectedWasteTypes,
//         estimateWeight: weightValue,
//         recurring: recurringPickup,
//       );

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Pickup scheduled successfully!')),
//       );
//     } catch (e) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Failed to schedule pickup: $e')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 214, 214, 214),
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 28, 106, 34),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {},
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: List.generate(6, (index) {
//                 return GestureDetector(
//                   onTap: () {
//                     setState(() {
//                       selectedDateIndex = index; // Update the selected index
//                     });
//                   },
//                   child: Container(
//                     width: 60,
//                     height: 80,
//                     padding: EdgeInsets.all(8),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                       color:
//                           selectedDateIndex == index
//                               ? Colors.blue[200]
//                               : Colors.white, // Highlight selected date
//                     ),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'][index],
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color:
//                                 selectedDateIndex == index
//                                     ? Colors.white
//                                     : Colors.black,
//                           ),
//                         ),
//                         SizedBox(height: 4),
//                         Text(
//                           ['16', '17', '18', '19', '20', '21'][index],
//                           style: TextStyle(
//                             color:
//                                 selectedDateIndex == index
//                                     ? Colors.white
//                                     : Colors.black,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               }),
//             ),
//             SizedBox(height: 20),
//             Row(
//               children: [
//                 Checkbox(
//                   value: repeatWeekly,
//                   onChanged: (bool? value) {
//                     setState(() {
//                       repeatWeekly = value!;
//                     });
//                   },
//                 ),
//                 Text(
//                   'Repeat Weekly',
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//                 Spacer(),
//                 DropdownButton<String>(
//                   value: dropdownValue,
//                   onChanged: (String? newValue) {
//                     setState(() {
//                       dropdownValue = newValue!;
//                     });
//                   },
//                   items:
//                       <String>[
//                         '1 Week',
//                         '2 Weeks',
//                         '3 Weeks',
//                       ].map<DropdownMenuItem<String>>((String value) {
//                         return DropdownMenuItem<String>(
//                           value: value,
//                           child: Text(value),
//                         );
//                       }).toList(),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Garbage',
//               style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//             ),
//             SizedBox(height: 8),
//             Container(
//               padding: EdgeInsets.all(8),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Column(
//                 children: List.generate(garbageTypes.length, (index) {
//                   return Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 2.0),
//                     child: Container(
//                       height: 70,
//                       decoration: BoxDecoration(
//                         color: const Color.fromARGB(255, 255, 255, 255),
//                         borderRadius: BorderRadius.circular(15),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(
//                               left: 10,
//                             ), // Add left margin
//                             child: Row(
//                               children: [
//                                 Checkbox(
//                                   value: garbageChecked[index],
//                                   onChanged: (value) {
//                                     setState(() {
//                                       garbageChecked[index] = value!;
//                                     });
//                                   },
//                                 ),
//                                 Icon(
//                                   Icons.recycling,
//                                   color: const Color.fromARGB(255, 28, 106, 34),
//                                 ),
//                                 SizedBox(width: 8),
//                                 Text(
//                                   garbageTypes[index],
//                                   style: TextStyle(fontSize: 18),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(
//                               right: 10,
//                             ), // Add right margin
//                             child: Row(
//                               children: [
//                                 IconButton(
//                                   icon: Icon(
//                                     Icons.remove_circle_outline,
//                                     size: 20,
//                                   ),
//                                   onPressed: () {
//                                     setState(() {
//                                       if (garbageWeights[index] > 0.1) {
//                                         garbageWeights[index] -= 0.1;
//                                       }
//                                     });
//                                   },
//                                 ),
//                                 Text(
//                                   '${garbageWeights[index].toStringAsFixed(1)} Kg',
//                                   style: TextStyle(fontSize: 16),
//                                 ),
//                                 IconButton(
//                                   icon: Icon(
//                                     Icons.add_circle_outline,
//                                     size: 20,
//                                   ),
//                                   onPressed: () {
//                                     setState(() {
//                                       garbageWeights[index] += 0.1;
//                                     });
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 }),
//               ),
//             ),
//             SizedBox(height: 0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'PICK UP ADDRESS',
//                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//                 ),
//                 TextButton(
//                   onPressed: () {},
//                   child: Row(
//                     children: [
//                       Icon(Icons.edit, color: Colors.blue),
//                       Text(
//                         'Edit Address',
//                         style: TextStyle(color: Colors.blue),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             Card(
//               child: ListTile(
//                 leading: Icon(
//                   Icons.home,
//                   color: const Color.fromARGB(255, 28, 106, 34),
//                 ),
//                 title: Text(
//                   'HOME',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Color.fromARGB(255, 28, 106, 34), // Green color
//                   ),
//                 ),
//                 subtitle: Text(
//                   address,
//                 ),
//               ),
//             ),
//             SizedBox(height: 50),
//             ElevatedButton(
//               onPressed: submitPickup,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color.fromARGB(255, 28, 106, 34),
//                 padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Icon(Icons.add, color: Colors.white, size: 25),
//                   SizedBox(width: 8),
//                   Text(
//                     'New Pickup',
//                     style: TextStyle(fontSize: 18, color: Colors.white),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

//Code Kimin

import 'package:flutter/material.dart';
import 'package:bin_band_group/controllers/schedule_controller.dart';
import 'package:bin_band_group/screens/activity_screen.dart';
import 'package:table_calendar/table_calendar.dart';

class SchedulePickupScreen extends StatefulWidget {
  @override
  _SchedulePickupScreenState createState() => _SchedulePickupScreenState();
}

class _SchedulePickupScreenState extends State<SchedulePickupScreen> {
  DateTime? selectedDate;
  DateTime focusedDate = DateTime.now();
  List<String> selectedWasteTypes = [];
  String estimatedWeight = "";
  bool recurringPickup = false;
  bool showErrors = false;

  final List<String> _wasteTypes = ["Plastic", "Metal", "Paper", "Glass"];
  final ScheduleController _scheduleController = ScheduleController();

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      selectedDate = selectedDay;
      focusedDate = focusedDay;
      showErrors = false; // Hide errors when user selects a date
    });
  }

  Future<void> _schedulePickup() async {
    setState(() {
      showErrors = true; // Show errors if form is incomplete
    });

    if (selectedDate == null ||
        selectedWasteTypes.isEmpty ||
        estimatedWeight.isEmpty) {
      return; // Stop if validation fails
    }

    try {
      final weightValue =
          double.tryParse(estimatedWeight.replaceAll(RegExp(r'[^0-9.]'), '')) ??
          0.0;

      await _scheduleController.createNewSchedule(
        userId: "1",
        date: selectedDate!.toIso8601String(),
        wasteTypes: selectedWasteTypes,
        estimateWeight: weightValue,
        recurring: recurringPickup,
      );

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Pickup scheduled successfully!')));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to schedule pickup: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Schedule Pickup",
          style: TextStyle(
            color: const Color.fromARGB(255, 28, 106, 34),
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: const Color.fromARGB(255, 28, 106, 34),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            TableCalendar(
              firstDay: DateTime(2000),
              lastDay: DateTime(2101),
              focusedDay: focusedDate,
              selectedDayPredicate: (day) => isSameDay(selectedDate, day),
              onDaySelected: _onDaySelected,
              onPageChanged: (date) {
                setState(() {
                  focusedDate = date;
                });
              },
              calendarFormat: CalendarFormat.month,
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              daysOfWeekStyle: DaysOfWeekStyle(
                weekdayStyle: TextStyle(
                  color: const Color.fromARGB(255, 28, 106, 34),
                ),
                weekendStyle: TextStyle(color: Colors.red),
              ),
              calendarStyle: CalendarStyle(
                selectedDecoration: BoxDecoration(
                  color: const Color.fromARGB(255, 28, 106, 34),
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: Colors.grey[300],
                  shape: BoxShape.circle,
                ),
              ),
            ),
            if (showErrors && selectedDate == null)
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  "Please select a date.",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            SizedBox(height: 20),

            // Waste Type Section
            _buildSectionTitle("Garbage Type",),
            SizedBox(height: 10),
            Wrap(
              spacing: 5,
              children:
                  _wasteTypes.map((type) {
                    bool isSelected = selectedWasteTypes.contains(type);
                    return ChoiceChip(
                      label: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.recycling, // Recycle icon
                            color: isSelected ? Colors.white : Colors.black,
                            size: 15,
                          ),
                          SizedBox(width: 3),
                          Text(
                            type,
                            style: TextStyle(
                              color: isSelected ? Colors.white : Colors.black,
                              fontWeight:
                                  isSelected
                                      ? FontWeight.bold
                                      : FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                      selected: isSelected,
                      onSelected: (selected) {
                        setState(() {
                          if (selected) {
                            selectedWasteTypes.add(type);
                          } else {
                            selectedWasteTypes.remove(type);
                          }
                          showErrors =
                              false; // Hide errors when user selects waste type
                        });
                      },
                      selectedColor: const Color.fromARGB(255, 28, 106, 34),
                      backgroundColor: Colors.grey[200],
                    );
                  }).toList(),
            ),
            if (showErrors && selectedWasteTypes.isEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  "Please select at least one waste type.",
                  style: TextStyle(color: Colors.red),
                ),
              ),
            SizedBox(height: 20),

            // Estimate Weight/Volume Section
            _buildSectionTitle("Total weight of Garbage"),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.grey[200],
                hintText: "5kg/1bag",
                errorText:
                    showErrors && estimatedWeight.isEmpty
                        ? "Please enter an estimated weight."
                        : null,
              ),
              onChanged: (value) {
                setState(() {
                  estimatedWeight = value;
                  showErrors = false; // Hide errors when user enters weight
                });
              },
            ),
            SizedBox(height: 20),

            // Recurring Pickup Section
            _buildSectionTitle("Recurring Pickup"),
            SizedBox(height: 10),
            SwitchListTile(
              title: Text(""),
              value: recurringPickup,
              onChanged: (value) {
                setState(() {
                  recurringPickup = value;
                });
              },
              activeColor: const Color.fromARGB(255, 28, 106, 34),
              secondary: Icon(
                Icons.refresh,
                color: const Color.fromARGB(255, 28, 106, 34),
              ),
            ),
            SizedBox(height: 20),

            // History Button
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.pushReplacement(
            //       context,
            //       MaterialPageRoute(builder: (context) => ActivityScreen()),
            //     );
            //   },
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.grey[300],
            //     minimumSize: Size(double.infinity, 50),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //   ),
            //   child: Text(
            //     "History",
            //     style: TextStyle(
            //       color: Colors.black,
            //       fontSize: 15,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            // SizedBox(height: 10),

            // Schedule Pickup Button
            ElevatedButton(
              onPressed: _schedulePickup,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 28, 106, 34),
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.add, // Add icon
                    color: Colors.white,
                    size: 25,
                  ),
                  SizedBox(
                    width: 8,
                  ), // Add some space between the icon and text
                  Text(
                    "New Pickup",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
    );
  }
}
