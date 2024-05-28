import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  // Add necessary controllers for handling user input
  TextEditingController _nameController = TextEditingController();
  TextEditingController _contactController = TextEditingController();

  // Add a form key for form validation
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _fetchUserProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Profile',
            style: TextStyle(
                color: Colors.blue[800], fontWeight: FontWeight.bold)),
        backgroundColor: Colors.grey[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Update User Profile',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800]),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Full Name',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your full name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _contactController,
                decoration: InputDecoration(
                  hintText: 'Contact Details',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your contact details';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  // Validate the form before proceeding
                  if (_formKey.currentState?.validate() ?? false) {
                    // Perform actions with the user details
                    await _updateUserProfile();
                    // Fetch the updated user profile
                    _fetchUserProfile();
                  }
                },
                child: Text('Update Profile',
                    style: TextStyle(color: Colors.white)),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Method to handle updating the user profile
  Future<void> _updateUserProfile() async {
    try {
      // Get the current user
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Update the user profile details in Firestore
        await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
          'full_name': _nameController.text,
          'contact_details': _contactController.text,
        });

        // Show a snackbar to indicate success
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('User profile updated successfully!'),
            duration: Duration(seconds: 2),
          ),
        );

        // Clear the form after updating
        _formKey.currentState?.reset();
      }
    } catch (e) {
      // Handle errors, e.g., show a snackbar or log the error
      print('Error updating user profile: $e');
    }
  }

  // Method to fetch the user profile data
  void _fetchUserProfile() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        DocumentSnapshot userProfile = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        // Check if the user profile exists
        if (userProfile.exists) {
          // Set the retrieved data to the controllers
          _nameController.text = userProfile['full_name'];
          _contactController.text = userProfile['contact_details'];
        }
      }
    } catch (e) {
      print('Error fetching user profile: $e');
    }
  }
}
