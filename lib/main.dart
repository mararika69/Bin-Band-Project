import 'package:bin_band_group/bloc/user_bloc.dart';
import 'package:bin_band_group/screens/home_sceen.dart';
// import 'package:bin_band_group/screens/home_screen.dart';
import 'package:bin_band_group/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:bin_band_group/services/storage_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  // Ensure Flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize storage service
  final StorageService storageService = StorageService();

  // Check authentication token
  final token = await storageService.getToken();

  // Run the app
  runApp(MyApp(isLoggedIn: token != null));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  
  const MyApp({
    super.key, 
    required this.isLoggedIn
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Bin Band Group',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.blue[200],
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(nextScreen: isLoggedIn ? HomeScreen() : LoginScreen()),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  final Widget nextScreen;

  const SplashScreen({
    Key? key, 
    required this.nextScreen,
  }) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Navigate to next screen after 2 seconds
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => widget.nextScreen),
      );
    });
  }

  @override
 Widget build(BuildContext context) {
  return Scaffold(
    backgroundColor: Colors.white,
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Circular Logo
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.green, width: 2),
              image: DecorationImage(
                image: AssetImage('assets/images/logo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
            'Bin Band Group',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.green,
            ),
          ),
          SizedBox(height: 20),
          CircularProgressIndicator(),
        ],
      ),
    ),
  );
}
}