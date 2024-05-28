import 'package:flutter/material.dart';

class AccountRecovery extends StatefulWidget {
  @override
  _AccountRecoveryState createState() => _AccountRecoveryState();
}

class _AccountRecoveryState extends State<AccountRecovery> {
  // Add necessary controllers for handling user input
  TextEditingController _emailController = TextEditingController();

  // Add a form key for form validation
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Account Recovery'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Account Recovery',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  // Add email format validation if needed

                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Validate the form before proceeding
                  if (_formKey.currentState?.validate() ?? false) {
                    // Perform actions for account recovery (e.g., send recovery email)
                    _recoverAccount();
                  }
                },
                child: Text('Recover Account'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method to handle account recovery
  void _recoverAccount() {
    // Implement the logic for account recovery
    // You can use Firebase or any other backend service for this
    // For simplicity, let's print the recovery email for now
    print('Recovery Email Sent to: ${_emailController.text}');

    // You can add further logic to send a recovery email or code to the user
    // Clear the form after initiating account recovery
    _formKey.currentState?.reset();
  }
}
