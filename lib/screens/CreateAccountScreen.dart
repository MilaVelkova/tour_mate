import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreen();
}

class _CreateAccountScreen extends State<CreateAccountScreen> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String? _errorMessage;

  bool _isValidEmail(String email) {
    final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegExp.hasMatch(email);
  }

  Future<void> signUp() async {
    setState(() {
      _errorMessage = null;
    });

    if (!_formKey.currentState!.validate()) return;

    try {
      await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Signup Successful! Redirecting...',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );

      Future.delayed(Duration(seconds: 2), () {
        Navigator.pushReplacementNamed(context, '/login');
      });

    } on FirebaseAuthException catch (e) {
      setState(() {
        if (e.code == 'email-already-in-use') {
          _errorMessage = 'User already exists';
        } else {
          _errorMessage = e.message ?? 'An error occurred';
        }
      });
    }
  }
  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    bool isPassword = false,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: controller,
          obscureText: isPassword,
          style: TextStyle(color: Colors.black),
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(color: Colors.black),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.white),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.blueAccent),
            ),
            errorStyle: TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold, fontSize: 14),
          ),
          validator: validator,
        ),
        SizedBox(height: 12),
      ],
    );
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  children: [
                    Text(
                      "Create Account",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Create an account so you can explore\nall adventures",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _buildTextField(
                        controller: _emailController,
                        label: "Email",
                        validator: (value) {
                          if (value!.isEmpty) return 'Enter an email';
                          if (!_isValidEmail(value)) return 'Enter a valid email address';
                          return null;
                        },
                      ),
                      _buildTextField(
                        controller: _passwordController,
                        label: "Password",
                        isPassword: true,
                        validator: (value) {
                          if (value!.length < 6) return 'Password must be at least 6 characters';
                          return null;
                        },
                      ),
                      _buildTextField(
                        controller: _confirmPasswordController,
                        label: "Confirm Password",
                        isPassword: true,
                        validator: (value) {
                          if (value != _passwordController.text) return 'Passwords do not match';
                          return null;
                        },
                      ),
                      if (_errorMessage != null)
                        Container(
                          padding: EdgeInsets.all(12),
                          margin: EdgeInsets.only(top: 8, bottom: 8),
                          decoration: BoxDecoration(
                            color: Colors.red.shade100,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.error, color: Colors.red),
                              SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  _errorMessage!,
                                  style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: signUp,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromRGBO(31, 65, 187, 1),
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          "Sign up",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 15),
                      OutlinedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/login');
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          side: BorderSide(color: Colors.white, width: 2),
                          minimumSize: Size(double.infinity, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          "Already have an account",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
