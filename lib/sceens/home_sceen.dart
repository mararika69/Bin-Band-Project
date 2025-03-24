import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<List<dynamic>> fetchRecentActivity() async {
    final response = await http.get(
      Uri.parse('https://api.example.com/recent-activity'),
      headers: {
        'Authorization':
            'eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNvcGhlYWtAZ21haWwuY29tIiwiZ2l2ZW5fbmFtZSI6InNvcGhlYWsiLCJzdWIiOiJhNjM0ZDBiMy02YzIzLTQ4ZGEtOTdhNy01ZTU4MTIxYzYyN2YiLCJpZCI6ImE2MzRkMGIzLTZjMjMtNDhkYS05N2E3LTVlNTgxMjFjNjI3ZiIsIm5iZiI6MTc0MjYyNzQ4MywiZXhwIjoxNzQzMjMyMjgzLCJpYXQiOjE3NDI2Mjc0ODMsImlzcyI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTI0NiIsImF1ZCI6Imh0dHA6Ly9sb2NhbGhvc3Q6NTI0NiJ9.FaV-cWHryyLE_r9QJ47TGeQekrrN2gSC8tNR46p1ctRrnvlmkCVQ-HjcMwJUd5iQA85DPjMDUFNLGALgFhvYOA',
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load recent activity');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recent Activity"),
        backgroundColor: Colors.green,
      ),
      body: FutureBuilder<List<dynamic>>(
        future: fetchRecentActivity(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No recent activity found"));
          } else {
            return ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return activityCard(snapshot.data![index]);
              },
            );
          }
        },
      ),
    );
  }

  Widget activityCard(dynamic activity) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        height: 80,
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 3,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFC2F8D4),
              ),
              child: Center(
                child: Icon(Icons.recycling, size: 24, color: Colors.green),
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    activity['title'],
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    "${activity['estimateWeight']} kg",
                    style: TextStyle(fontSize: 12, color: Colors.black),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "+ ${activity['points']} Points",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  activity['date'],
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
