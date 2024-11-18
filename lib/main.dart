// main.dart
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core
import 'package:hw4/pages/chat_page.dart';  
import 'package:hw4/pages/home_page.dart';
import 'package:hw4/pages/login_page.dart';
import 'package:hw4/pages/register_page.dart';
import 'package:hw4/pages/splash_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Ensure bindings are initialized
  await Firebase.initializeApp(); // Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Message Board App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashPage(),    // Splash Page
        '/login': (context) => LoginPage(), // Login Page
        '/register': (context) => RegisterPage(), // Registration Page
        '/home': (context) => HomePage(),  // Home Page
        '/chat': (context) => ChatPage(),  // Chat Page
      },
    );
  }
}
