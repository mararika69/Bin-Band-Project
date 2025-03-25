import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: RedeemPointsScreen()));
}

class RedeemPointsScreen extends StatelessWidget {
  const RedeemPointsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
         
          children: [
            const SizedBox(height: 20),
            const Text(
              "All Redeem Points",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1B5E1F), // Correct way to set color
              ),
            ),

            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 30,
              children: [
                Container(
                  height: 180,
                  width: 150,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 40,
                        height: 40,
                        child: CircleAvatar(
                          backgroundColor: Color(0xFFC2F8D4),
                          child: Icon(
                            Icons.currency_exchange,
                            size: 20,
                            color: Color.fromARGB(255, 43, 109, 45),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Cash Voucher",
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        "\$ 10",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1B5E1F),
                        ),
                      ),
                      const Text("150 Points", style: TextStyle(fontSize: 10)),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 50,
                        height: 20,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            textStyle: const TextStyle(fontSize: 8),
                            backgroundColor: Color(0xFF1B5E1F),
                          ),
                          child: const Center(
                            child: Text(
                              "Redeem",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 180,
                  width: 150,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        width: 40,
                        height: 40,
                        child: CircleAvatar(
                          backgroundColor: Color(0xFFC2F8D4),
                          child: Icon(
                            Icons.currency_exchange,
                            size: 20,
                            color: Color.fromARGB(255, 43, 109, 45),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Cash Voucher",
                        style: TextStyle(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                      const Text(
                        "\$ 10",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1B5E1F),
                        ),
                      ),
                      const Text("150 Points", style: TextStyle(fontSize: 10)),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: 50,
                        height: 20,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.zero,
                            textStyle: const TextStyle(fontSize: 8),
                            backgroundColor: Color(0xFF1B5E1F),
                          ),
                          child: const Center(
                            child: Text(
                              "Redeem",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
