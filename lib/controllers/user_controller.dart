import 'package:bin_band_group/bloc/user_bloc.dart';
import 'package:bin_band_group/models/user_model.dart';
import 'package:bin_band_group/services/api_service.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

class UserController {
  final ApiService _apiService = ApiService();

  // Login method with improved error handling
  Future<User?> login(String username, String password, [UserBloc? userBloc]) async {
    try {
      final user = await _apiService.login(username, password);
      if (user != null && userBloc != null) {
        userBloc.add(SetUserEvent(user)); // Dispatch user event to bloc
      }
      return user;
    } catch (e) {
      print("Error during login: $e"); // Handle the error gracefully
      return null;
    }
  }

  // Register method with error handling
  Future<bool> register(String email, String profileImageUrl, String username, String password) async {
    try {
      final user = User(
        email: email,
        profileImageUrl: profileImageUrl,
        userName: username,
        password: password,
      );
      return await _apiService.register(user);
    } catch (e) {
      print("Error during registration: $e");
      return false;
    }
  }

  // Fetch users with error handling
  Future<List<User>> fetchUsers() async {
    try {
      return await _apiService.fetchUsers();
    } catch (e) {
      print("Error fetching users: $e");
      return []; // Return an empty list in case of error
    }
  }

  // Optionally, add a logout method

}
