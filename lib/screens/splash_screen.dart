// import 'package:bin_band_group/screens/login_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class SplashScreen extends StatefulWidget {
//   // Allow customization of splash screen duration
//   final int durationInSeconds;
//   final Widget nextScreen;

//   const SplashScreen({
//     Key? key, 
//     this.durationInSeconds = 2, // Default to 2 seconds
//     required this.nextScreen,
//   }) : super(key: key);

//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // Set device orientation to portrait
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown,
//     ]);

//     // Navigate to next screen after specified duration
//     Future.delayed(Duration(seconds: widget.durationInSeconds), () {
//       Navigator.of(context).pushReplacement(
//         MaterialPageRoute(builder: (_) => widget.nextScreen),
//       );
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Container(
//           width: 150,
//           height: 150,
//           decoration: BoxDecoration(
//             shape: BoxShape.circle,
//             border: Border.all(color: Colors.green, width: 2),
//             color: Colors.white,
//           ),
//           child: Center(
//             child: Image.asset(
//               'icons/logo.png', // Your logo path
//               width: 100,
//               height: 100,
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     // Reset orientation when leaving splash screen
//     SystemChrome.setPreferredOrientations([
//       DeviceOrientation.landscapeRight,
//       DeviceOrientation.landscapeLeft,
//       DeviceOrientation.portraitUp,
//       DeviceOrientation.portraitDown,
//     ]);
//     super.dispose();
//   }
// }

// // Usage in main.dart or navigation
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SplashScreen(
//         durationInSeconds: 1, // Set to 1 second for faster transition
//         nextScreen: LoginScreen(), // Or your main screen
//       ),
//     );
//   }
// }