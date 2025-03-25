import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Line Chart
            Center(
              child: AspectRatio(
                aspectRatio: 1.5,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: LineChart(
                    LineChartData(
                      gridData: FlGridData(show: true),
                      titlesData: FlTitlesData(
                        leftTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: true, interval: 1),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(showTitles: true, interval: 1),
                        ),
                          topTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false), // Hide top
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false), // Hide right
                      ),
                      ),
                      borderData: FlBorderData(show: true),
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            FlSpot(0, 1),
                            FlSpot(1, 3),
                            FlSpot(2, 2),
                            FlSpot(3, 5),
                            FlSpot(4, 4),
                            FlSpot(5, 6),
                            FlSpot(6, 8),
                          ],
                          isCurved: true,
                          color: Colors.blue,
                          barWidth: 3,
                          isStrokeCapRound: true,
                          belowBarData: BarAreaData(
                            show: true,
                            color: const Color.fromARGB(255, 49, 201, 112)
                                .withOpacity(0.3),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),


            // Quick Actions Section
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
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xFFC2F8D4),
                    border: Border.all(
                      color: const Color(0xFF1B5E1F),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.calendar_month_outlined,
                        size: 25,
                        color: Color.fromARGB(255, 43, 109, 45),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Schedule",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      const Text("Pickup button"),
                    ],
                  ),
                ),
                const SizedBox(width: 38),

                // Second Container
                Container(
                  height: 120,
                  width: 150,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xFFFFEFBC),
                    border: Border.all(
                      color: const Color(0xFFFFB587),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.wallet_giftcard,
                        size: 25,
                        color: Color.fromARGB(255, 43, 109, 45),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        "Redeem",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text("Points button"),
                    ],
                  ),
                ),
              ],
            ),

            // Recent Activity Section
            Padding(
              padding: const EdgeInsets.all(25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Recent Activity",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(fontSize: 15, color: Colors.blue),
                  ),
                ],
              ),
            ),

            // Recent Activity Card
            Center(
              child: Container(
                height: 80,
                width: 347,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 2),
                    ),
                  ],
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
                      child: const Center(
                        child: Icon(
                          Icons.recycling,
                          size: 24,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12), // Space between icon and text

                    // Column for Activity Name & Amount
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
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

                    // Column for Points & Time
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "+ 7 Points",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
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

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}