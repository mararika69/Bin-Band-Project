// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:app_test/models/user_model.dart'; // Ensure this import exists
// import 'package:app_test/models/activity_model.dart'; // Ensure this import exists
// import 'package:app_test/services/storage_service.dart';

// class ApiService {
//   static const String baseUrl = 'https://pay1.jetdev.life';
//   final StorageService _storageService = StorageService();

//   Future<User?> login(String email, String password) async {
//     final response = await http.post(
//       Uri.parse('$baseUrl/api/account/login'),
//       body: jsonEncode({'username': email, 'password': password}),
//       headers: {'Content-Type': 'application/json'},
//     );
//     if (response.statusCode == 200) {
//       final user = User.fromJson(jsonDecode(response.body));
//       if (user.token != null) {
//         await _storageService.saveToken(user.token!); // Save token
//       }
//       return user;
//     }
//     return null;
//   }

//   Future<bool> register(User user) async {
//     final response = await http.post(
//       Uri.parse('$baseUrl/api/account/register'),
//       body: jsonEncode(user.toJson()), // Includes password in the payload
//       headers: {'Content-Type': 'application/json'},
//     );
//     return response.statusCode == 200;
//   }

//   Future<List<Activity>> fetchActivities({int limit = 20}) async {
//     final token = await _storageService.getToken(); // Retrieve token
//     if (token == null) {
//       throw Exception('Token not found');
//     }

//     final response = await http.get(
//       Uri.parse('$baseUrl/api/account/activity?limit=$limit'),
//       headers: {'Authorization': 'Bearer $token'}, // Use token
//     );

//     if (response.statusCode == 200) {
//       List<dynamic> data = jsonDecode(response.body);
//       return data.map((json) => Activity.fromJson(json)).toList();
//     }
//     return [];
//   }
// }

import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/schedule_model.dart'; // Ensure this is correct

class ApiService {
  static const String baseUrl = "https://yourapi.com/api"; // Replace with actual API URL

  Future<bool> schedulePickup(PickupRequest pickup) async {
    final url = Uri.parse("$baseUrl/pickup");
    
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(pickup.toJson()),
    );

    if (response.statusCode == 201) {
      return true; // Successfully posted
    } else {
      print("Error: ${response.statusCode} - ${response.body}"); // Debugging
      return false; // Handle error
    }
  }
}


