import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'homescreen.dart'; // Ensure you import the correct file for AuthScreen

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Quizz")),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundColor: Colors.blue,
              backgroundImage: AssetImage("assets/default_avatar.png"),
              radius: 40,
            ),
            SizedBox(height: 10),
            Text("User Name", style: TextStyle(fontSize: 20)),
            SizedBox(height: 5),
            Text("user@example.com", style: TextStyle(fontSize: 16, color: Colors.blue)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _showSignOutDialog(context);
              },
              child: Text("Sign Out"),
            ),
          ],
        ),
      ),
    );
  }

  void _showSignOutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Sign Out"),
          content: Text("Are you sure you want to sign out?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog first
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => AuthScreen()),
                ); // Navigate to AuthScreen
              },
              child: Text("Yes"),
            ),
          ],
        );
      },
    );
  }
}
