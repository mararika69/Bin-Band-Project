import 'package:bin_band_group/bloc/user_bloc.dart';
import 'package:bin_band_group/screens/home_sceen.dart';
import 'package:bin_band_group/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:bin_band_group/services/storage_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final StorageService storageService = StorageService();
  final token = await storageService.getToken(); 
  runApp(MyApp(isLoggedIn: token != null));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (context) => UserBloc(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.blue[200],
          scaffoldBackgroundColor: Colors.white,
        ),
        debugShowCheckedModeBanner: false,
        // Show HomeScreen if logged in, otherwise show LoginScreen
        home: isLoggedIn ? HomeScreen() : const LoginScreen(),
      ),
    );
  }
}
