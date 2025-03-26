import 'package:bin_band_group/screens/login_screen.dart';
import 'package:bin_band_group/screens/navigation_bottom_screen.dart';
import 'package:bin_band_group/screens/schedule_pickup_screen%20.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      // home: LoginScreen(),
      home: SchedulePickupScreen(),
      // home: NavigationBottomScreen(),
    );
  }
}