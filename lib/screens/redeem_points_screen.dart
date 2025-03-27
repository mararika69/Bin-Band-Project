import 'package:bin_band_group/controllers/redeem_controller.dart';
import 'package:bin_band_group/models/redeem_model.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: RedeemPointsScreen()));
}

class RedeemPointsScreen extends StatefulWidget {
  @override
  _RedeemPointsScreenState createState() => _RedeemPointsScreenState();
}

class _RedeemPointsScreenState extends State<RedeemPointsScreen> {
  final RedeemController _redeemController = RedeemController();
  late Future<List<Redeem>> _redeem;

  @override
  void initState() {
    super.initState();
    _redeem = _redeemController.fetchRedeems(); // Fetch redeem data
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to the HomeScreen
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        title: const Text("Redeem Points"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Single FutureBuilder to handle loading data
            FutureBuilder<List<Redeem>>(
              future: _redeem,
              builder: (context, snapshot) {
                // Handling different states of the Future
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("Error loading data: ${snapshot.error}"),
                  );
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text("No redeem points available"));
                }

                // Data loaded successfully, display redeem points
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(), // Disable scrolling for GridView inside SingleChildScrollView
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // 2 columns
                      crossAxisSpacing: 16, // Horizontal space between items
                      mainAxisSpacing: 16, // Vertical space between items
                      childAspectRatio: 0.8, // Adjust the size of the cards
                    ),
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return _buildRedeemCard(snapshot.data![index]);
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildRedeemCard(Redeem redeem) {
    return Center(
      heightFactor: 1.5,
      child: Container(
        height: 200,
        width: 150,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.20), blurRadius: 4),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              backgroundColor: Color(0xFFC2F8D4),
              radius: 20,
              child: Icon(Icons.currency_exchange, size: 20, color: Color(0xFF2B6D2D)),
            ),
            const SizedBox(height: 10),
            Text(
              redeem.title,
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
            Text(
              redeem.description,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Color(0xFF1B5E1F)),
            ),
            Text(
              "${redeem.exchangePoint} Points",
              style: const TextStyle(fontSize: 10),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 50,
              height: 20,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  textStyle: const TextStyle(fontSize: 8),
                  backgroundColor: const Color(0xFF1B5E1F),
                ),
                child: const Center(
                  child: Text("Redeem", style: TextStyle(color: Colors.white)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
