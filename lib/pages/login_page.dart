import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';  // Firebase Authentication package

// LoginPage widget
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Form key for form validation
  final _loginFormKey = GlobalKey<FormState>();

  // Controllers for user input fields
  final TextEditingController _userEmailController = TextEditingController();
  final TextEditingController _userPasswordController = TextEditingController();

  // FirebaseAuth instance for user authentication
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  // Function to handle user login
  Future<void> _performLogin() async {
    try {
      // Try signing in with the provided email and password
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: _userEmailController.text,
        password: _userPasswordController.text,
      );

      // Navigate to the next page if the login is successful
      if (userCredential.user != null) {
        Navigator.pushReplacementNamed(context, '/home'); // Replace with actual route
      }
    } on FirebaseAuthException catch (e) {
      // Handle any errors during authentication
      String errorMessage = 'An error occurred. Please try again.';
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email address.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Incorrect password. Please try again.';
      }

      // Show error message via SnackBar
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _loginFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              // User email field
              TextFormField(
                controller: _userEmailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  hintText: 'Enter your email address',
                ),
                validator: (inputValue) {
                  if (inputValue == null || inputValue.isEmpty) {
                    return 'Enter your email address.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // User password field
              TextFormField(
                controller: _userPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',
                ),
                validator: (inputValue) {
                  if (inputValue == null || inputValue.isEmpty) {
                    return 'Enter your password.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 32),

              // Login button
              ElevatedButton(
                onPressed: () {
                  if (_loginFormKey.currentState?.validate() ?? false) {
                    _performLogin(); // Call the login function if form is valid
                  }
                },
                child: const Text('Log In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
