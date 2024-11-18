import 'package:flutter/material.dart';
import 'dart:async';  // For the delayed navigation

// SplashPage widget
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  // Set up a timer to navigate after a few seconds
  @override
  void initState() {
    super.initState();
    _navigateToNextPage();
  }

  // Function to navigate to the next page after a delay
  _navigateToNextPage() {
    Timer(const Duration(seconds: 3), () {
      // Navigate to the login page
      Navigator.pushReplacementNamed(context, '/login');  // Replace '/login' with the correct route if needed
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,  // Background color for the splash page
      body: Center(
        child: Icon(
          Icons.sentiment_satisfied,  // Happy face icon
          size: 200,  // Icon size
          color: Colors.white,  // Icon color
        ),
      ),
    );
  }
}
