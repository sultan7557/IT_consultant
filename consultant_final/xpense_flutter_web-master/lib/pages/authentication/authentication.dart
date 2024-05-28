import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xpense_flutter_web/pages/home.dart';

class AuthenticationPage extends StatefulWidget {
  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final InputDecoration decoration;
  final FormFieldValidator<String> validator;
  final Key? key;

  PasswordField({
    this.key,
    required this.controller,
    required this.decoration,
    required this.validator,
  }) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
        labelText: widget.decoration.labelText,
        fillColor: widget.decoration.fillColor,
        filled: widget.decoration.filled,
        border: widget.decoration.border,
        labelStyle: widget.decoration.labelStyle,
      ),
      obscureText: _obscureText,
      validator: widget.validator,
    );
  }
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  // Controllers for handling user input
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  // Form key for form validation
  final _formKey = GlobalKey<FormState>();

  // Firebase Authentication instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFB2DFDB),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16),
                Image.asset(
                  'assets/images/logo_consult.jpg',
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 16),
                Text(
                  'Authentication',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 0, 0, 0)),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          BorderSide(color: Color(0xFF001F3F), width: 1),
                    ),
                    labelStyle: TextStyle(color: Color(0xFFCCCCCC)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    // Add email format validation if needed
                    return null;
                  },
                ),
                PasswordField(
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide:
                          BorderSide(color: Color(0xFF001F3F), width: 1),
                    ),
                    labelStyle: TextStyle(color: Color(0xFF004D40)),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    // Add password strength validation if needed
                    return null;
                  },
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Validate the form before proceeding
                    if (_formKey.currentState?.validate() ?? false) {
                      // Perform actions for authentication (e.g., sign in or sign up)
                      _authenticateUser();
                    }
                  },
                  child: Text('Login'),
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFB2DFDB),
                    onPrimary: Colors.white,
                    padding: EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    // Validate the form before proceeding
                    if (_formKey.currentState?.validate() ?? false) {
                      // Perform actions for signup
                      _signupUser();
                    }
                  },
                  child: Text('Signup'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Color(0xFF004D40),
                    padding: EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                      side: BorderSide(color: Color(0xFF001F3F), width: 2),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Method to handle user authentication
  void _authenticateUser() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      print('Authentication Successful: ${userCredential.user?.email}');

      //Create a user document in firestore if it doesnt exist
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'email': userCredential.user!.email,
        // Add other user details as needed
      });

      // Navigate to home page after successful login
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    } on FirebaseAuthException catch (e) {
      print('Authentication Failed: $e');
      // Handle specific authentication exceptions if needed
    }

    // Clear the form after attempting authentication
    _formKey.currentState?.reset();
  }

  // Method to handle user signup
  void _signupUser() async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      print('Signup Successful: ${userCredential.user?.email}');

      // Create a user document in Firestore
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set({
        'email': userCredential.user!.email,
        // Add other user details as needed
      });

      // Navigate to home page after successful signup
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    } on FirebaseAuthException catch (e) {
      print('Signup Failed: $e');
      // Handle specific signup exceptions if needed
    }

    // Clear the form after attempting signup
    _formKey.currentState?.reset();
  }
}
