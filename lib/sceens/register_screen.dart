import 'package:bin_band_group/controllers/user_controller.dart';
import 'package:bin_band_group/sceens/login_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _profileImageController = TextEditingController();
  final UserController _userController = UserController();

  void _register(BuildContext context) async {
    final email = _emailController.text;
    final password = _passwordController.text;
    final location = _locationController.text;
    final profileImageUrl = _profileImageController.text;

    final success = await _userController.register(email, profileImageUrl, location, password);
    if (success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(labelText: 'Location'),
            ),
            TextField(
              controller: _profileImageController,
              decoration: InputDecoration(labelText: 'Profile Image URL'),
            ),
            ElevatedButton(
              onPressed: () => _register(context),
              child: Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
