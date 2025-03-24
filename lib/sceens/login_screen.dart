import 'package:bin_band_group/bloc/user_bloc.dart';
import 'package:bin_band_group/controllers/user_controller.dart';
import 'package:bin_band_group/sceens/home_sceen.dart';
import 'package:bin_band_group/sceens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final UserController _userController = UserController();

  void _login() async {
    final username = _usernameController.text;
    final password = _passwordController.text;
    final userBloc = BlocProvider.of<UserBloc>(context); // Get UserBloc instance

    final user = await _userController.login(username, password, userBloc); // Pass UserBloc
    if (user != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextButton(
              onPressed: () {},
              child: Text('Forgot Password?'),
            ),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => RegisterScreen()),
                );
              },
              child: Text('New user? Register'),
            ),
          ],
        ),
      ),
    );
  }
}
