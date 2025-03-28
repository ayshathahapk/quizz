import 'package:flutter/material.dart';

import '../quizzsection/quizpage.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              "assets/images/wlcm.png", // Corrected path
              height: screenHeight * 0.4,
              fit: BoxFit.contain,
            ),
            ElevatedButton.icon(
              icon: Image.asset(
                "assets/images/ggltxt.png", // Corrected path
                height: screenHeight * 0.025,
                fit: BoxFit.contain,
              ),
              label: Text("Sign in with Google"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                padding: EdgeInsets.symmetric(
                  horizontal: screenWidth * 0.05,
                  vertical: screenHeight * 0.015,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 5,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizScreen()),
                );
              },

            ),
          ],
        ),
      ),
    );
  }
}
