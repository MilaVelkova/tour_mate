import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? _errorMessage;

  bool _isValidEmail(String email) {
    final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegExp.hasMatch(email);
  }

  void _login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    setState(() {
      _errorMessage = null;
    });

    if (email.isEmpty || password.isEmpty) {
      setState(() {
        _errorMessage = "Email and password cannot be empty";
      });
      return;
    }

    if (!_isValidEmail(email)) {
      setState(() {
        _errorMessage = "Please enter a valid email address";
      });
      return;
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      if (userCredential.user != null) {
        print("Login successful! User ID: ${userCredential.user?.uid}");
        Navigator.pushNamed(context, '/home');
      } else {
        print("Login failed. User is null.");
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        if (e.code == 'user-not-found') {
          _errorMessage = 'No user found for that email.';
        } else if (e.code == 'wrong-password') {
          _errorMessage = 'Incorrect password.';
        } else {
          _errorMessage = 'Login error: ${e.message}';
        }
      });
      Fluttertoast.showToast(msg: _errorMessage ?? 'Login failed');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/mountain.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Top Header Text
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  children: [
                    Text(
                      "Login here",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(5, 41, 60, 1),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Welcome back you've\nbeen missed!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),

              // Input Fields
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        errorText: _errorMessage != null ? _errorMessage : null,
                      ),
                    ),
                    SizedBox(height: 20),

                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.blue, width: 2),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        errorText: _errorMessage != null ? _errorMessage : null,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),

              // Buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(31, 65, 187, 1),
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Log in",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/create');
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                        side: BorderSide(color: Colors.black, width: 2),
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "Create new account",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
