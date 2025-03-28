import 'package:flutter/material.dart';

import '../authentication/signout.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int _currentQuestionIndex = 0;
  int _selectedOptionIndex = -1;
  int _score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Quiz')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LinearProgressIndicator(value: (_currentQuestionIndex + 1) / 5),
            SizedBox(height: 20),
            Text('Sample Question................?', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 20),
            ...List.generate(4, (index) {
              return GestureDetector(
                onTap: () {
                  setState(() => _selectedOptionIndex = index);
                },
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 8),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: _selectedOptionIndex == index ? Colors.blueAccent : Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black12),
                  ),
                  child: Text('Option ${index + 1}', style: TextStyle(fontSize: 16)),
                ),
              );
            }),
            Spacer(),
            ElevatedButton(
              onPressed: _selectedOptionIndex == -1 ? null : () {
                if (_currentQuestionIndex < 4) {
                  setState(() {
                    _currentQuestionIndex++;
                    _selectedOptionIndex = -1;
                  });
                } else {
                  showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: Text('Quiz Completed!'),
                      content: Text('Your Score: $_score/5'),
                      actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))],
                    ),
                  );
                }
              },
              child: Text(_currentQuestionIndex < 4 ? 'Next' : 'Finish'),
            ),
            ElevatedButton(
                onPressed:() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
            }, child: Text("Sign Out"))
          ],
        ),
      ),
    );
  }
}
