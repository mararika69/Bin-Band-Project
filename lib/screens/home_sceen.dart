import 'package:bin_band_group/bloc/user_bloc.dart';
import 'package:bin_band_group/screens/activity_screen.dart';
import 'package:bin_band_group/screens/redeem_points_screen.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bin_band_group/screens/schedule_pickup_screen .dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomeContent(), // Merged content here
    const Text('Pickup History'),
    const Text('Green Social'),
    const Text('Profile'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
    context.read<UserBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.blue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Pickup History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            label: 'Green Social',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              print("Current state: $state"); // Debugging line

              if (state is UserLoaded) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ), // Prevents tight space
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Centers content
                      children: [
                        // Profile Image
                        ClipOval(
                          child: Image.network(
                            state.user.profileImageUrl,
                            width: 20, // Constrain image size
                            height: 20,
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(width: 10), // Space between image and text
                        // Username (Wrap in Flexible to avoid overflow)
                        Flexible(
                          child: Text(
                            'Welcome, ${state.user.userName}!',
                            style: TextStyle(fontSize: 18),
                            overflow:
                                TextOverflow.ellipsis, // Prevents text overflow
                            maxLines: 1, // Ensures text fits in one line
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else if (state is Error) {
                return Center(
                  child: Text(
                    "Failed to load user data",
                    style: TextStyle(color: Colors.red),
                  ),
                );
              }
              return Center(
                child: CircularProgressIndicator(), // Show loading spinner
              );
            },
          ),
           SizedBox(height: 50), 

          Text('Total Points: 100'),
          Text('Total Cash: \$10'),

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
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      rightTitles: AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
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
                          color: Colors.green.withOpacity(0.3),
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
            padding: const EdgeInsets.all(16.0),
            child: Text(
              "Quick Actions",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              QuickActionCard(
                icon: Icons.calendar_month_outlined,
                title: "Schedule",
                subtitle: "Pickup button",
                color: Color(0xFFC2F8D4),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SchedulePickupScreen(),
                    ),
                  );
                },
              ),
              SizedBox(width: 16),
              QuickActionCard(
                icon: Icons.wallet_giftcard,
                title: "Redeem",
                subtitle: "Points button",
                color: Color(0xFFFFEFBC),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RedeemPointsScreen(),
                    ),
                  );
                },
              ),
            ],
          ),

          // Recent Activity Section
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Recent Activity",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ActivityScreen()),
                    );
                  },
                  child: Text("See all", style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          ),

          // Recent Activity Card
          RecentActivityCard(),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

// Quick Action Card Widget
class QuickActionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final Color color;
  final VoidCallback onTap; // Added onTap parameter

  QuickActionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.color,
    required this.onTap, // Include onTap in constructor
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Wrap the entire card in GestureDetector to handle onTap
      onTap: onTap, // Use onTap here
      child: Container(
        height: 120,
        width: 150,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: color,
          border: Border.all(color: Colors.black, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 25, color: Colors.green),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Text(subtitle),
          ],
        ),
      ),
    );
  }
}

// Recent Activity Card Widget
class RecentActivityCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
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
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFC2F8D4),
              ),
              child: const Center(
                child: Icon(Icons.recycling, size: 24, color: Colors.green),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Plastic Collection",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "3.5 kg",
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
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
    );
  }
}
