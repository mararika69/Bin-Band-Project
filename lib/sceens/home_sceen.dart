import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Text(
              "Quick Actions",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // First Container
              Container(
                height: 120,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15), // Rounded corners
                  color: Color(0xFFC2F8D4), // Background color
                  border: Border.all(
                    color: Color(0xFF1B5E1F), // Border color
                    width: 1, // Border width
                  ),
                ),

                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.calendar_month_outlined,
                        size: 25,
                        color: const Color.fromARGB(255, 43, 109, 45),
                      ),
                      Text(
                        "Schedule",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text("Pickup button"),
                    ],
                  ),
                ),
              ),

              SizedBox(width: 36), // Adds space between the containers
              // Second Container
              Container(
                height: 120,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color(0xFFFFEFBC),
                  border: Border.all(
                    color: Color(0xFFFFB587), // Border color
                    width: 1, // Border width
                  ),
                ),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.wallet_giftcard,
                        size: 25,
                        color: const Color.fromARGB(255, 43, 109, 45),
                      ),

                      Text(
                        "Redeem",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text("Points button"),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Adds space before the row
          // Recent Activity Section
          Padding(
            padding: EdgeInsets.all(25), // Adds padding around the Row
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // Spaces out children evenly
              children: [
                Text(
                  "Recent Activity", // First Text widget with bold and font size 18
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  "See all",
                  style: TextStyle(fontSize: 15, color: Colors.blue),
                ), // Second Text widget displaying "data"
              ],
            ),
          ),

          // Adds space after the row
          Center(
            child: Container(
              height: 80,
              width: 347,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Icon inside green rounded box
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFC2F8D4),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.recycling,
                        size: 24,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  SizedBox(width: 12), // Space between icon and text
                  // Column for Plastic Collection and 3.5 kg
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Plastic Collection",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "3.5 kg",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                  ),

                  // Column for Points and Time
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "+ 7 Points",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.green, // Green color for points
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "2 hours ago",
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15),
          Center(
            child: Container(
              height: 80,
              width: 347,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Icon inside green rounded box
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFFC2F8D4),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.settings,
                        size: 24,
                        color: Colors.green,
                      ),
                    ),
                  ),
                  SizedBox(width: 12), // Space between icon and text
                  // Column for Plastic Collection and 3.5 kg
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Plastic Collection",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          "3.5 kg",
                          style: TextStyle(fontSize: 12, color: Colors.black),
                        ),
                      ],
                    ),
                  ),

                  // Column for Points and Time
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "+ 7 Points",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.green, // Green color for points
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        "2 hours ago",
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
