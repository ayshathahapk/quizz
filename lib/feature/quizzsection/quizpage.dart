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
  late Stopwatch _stopwatch;

  final List<String> _questions = List.generate(10, (index) => 'Question ${index + 1}?');
  final List<List<String>> _options = List.generate(10, (index) => List.generate(4, (opt) => 'Option ${opt + 1}'));
  final List<int> _correctAnswers = List.generate(10, (index) => index % 4); // Example correct answers

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch()..start();
  }

  void _nextQuestion() {
    if (_selectedOptionIndex == _correctAnswers[_currentQuestionIndex]) {
      _score++;
    }

    if (_currentQuestionIndex < 9) {
      setState(() {
        _currentQuestionIndex++;
        _selectedOptionIndex = -1;
      });
    } else {
      _stopwatch.stop();
      _showResults();
    }
  }

  void _showResults() {
    final elapsedTime = _stopwatch.elapsed;
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Quiz Completed!'),
        content: Text('Your Score: $_score/10\nTime Taken: ${elapsedTime.inSeconds} seconds'),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: Text('OK'))],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white60,
          title: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text('Quiz'),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LinearProgressIndicator(value: (_currentQuestionIndex + 1) / 10),
              SizedBox(height: 20),
              Text(_questions[_currentQuestionIndex], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
                    child: Text(_options[_currentQuestionIndex][index], style: TextStyle(fontSize: 16)),
                  ),
                );
              }),
              Spacer(),
              ElevatedButton(
                onPressed: _selectedOptionIndex == -1 ? null : _nextQuestion,
                child: Text(_currentQuestionIndex < 9 ? 'Next' : 'Finish'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: Text("Sign Out"),
              )
            ],
          ),
        ),
      ),
    );
  }
}