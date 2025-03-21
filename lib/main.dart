// import 'package:bin_band_group/sceens/redeem_points_screen.dart';
import 'package:flutter/material.dart';
import 'package:bin_band_group/sceens/home_sceen.dart';

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
      home: const HomeScreen(),
    );
  }
}



    // Center(
    //           child: AspectRatio(
    //             aspectRatio: 1.5,
    //             child: Padding(
    //               padding: EdgeInsets.all(25.0),
    //               child: LineChart(
    //                 LineChartData(
    //                   gridData: FlGridData(show: true),
    //                   titlesData: FlTitlesData(
    //                     leftTitles: AxisTitles(
    //                       sideTitles: SideTitles(showTitles: true, interval: 1),
    //                     ),
    //                     bottomTitles: AxisTitles(
    //                       sideTitles: SideTitles(showTitles: true, interval: 1),
    //                     ),
    //                   ),
    //                   borderData: FlBorderData(show: true),
    //                   lineBarsData: [
    //                     LineChartBarData(
    //                       spots: [
    //                         FlSpot(0, 1),
    //                         FlSpot(1, 3),
    //                         FlSpot(2, 2),
    //                         FlSpot(3, 5),
    //                         FlSpot(4, 4),
    //                         FlSpot(5, 6),
    //                         FlSpot(6, 8),
    //                       ],
    //                       isCurved: true,
    //                       color: Colors.blue,
    //                       barWidth: 3,
    //                       isStrokeCapRound: true,
    //                       belowBarData: BarAreaData(
    //                         show: true,
    //                         color: const Color.fromARGB(
    //                           255,
    //                           49,
    //                           201,
    //                           112,
    //                         ).withOpacity(0.3),
    //                       ),
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //             ),
    //           ),
    //         ),




