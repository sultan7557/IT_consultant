import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ConsultantProfile extends StatefulWidget {
  @override
  _ConsultantProfileState createState() => _ConsultantProfileState();
}

class _ConsultantProfileState extends State<ConsultantProfile> {
  // Add necessary controllers for handling user input
  TextEditingController _skillsController = TextEditingController();
  TextEditingController _portfolioController = TextEditingController();
  TextEditingController _availabilityController = TextEditingController();

  // Add a form key for form validation
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultant Profile',
            style: TextStyle(
                color: Colors.blue[800], fontWeight: FontWeight.bold)),
        backgroundColor: Colors.grey[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Update Consultant Profile',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800]),
                ),
                SizedBox(height: 16),
                TextFormField(
                  controller: _skillsController,
                  decoration: InputDecoration(
                    hintText: 'Enter your skills and expertise',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.grey[100],
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your skills';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _portfolioController,
                  decoration: InputDecoration(
                    hintText: 'Enter your portfolio details',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.grey[100],
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your portfolio details';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _availabilityController,
                  decoration: InputDecoration(
                    hintText: 'Enter your availability details',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.grey[100],
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your availability details';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Validate the form before proceeding
                    if (_formKey.currentState?.validate() ?? false) {
                      // Perform actions with the consultant details (e.g., update database)
                      _updateConsultantProfile();
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
      ),
    );
  }

  // Method to handle updating the consultant profile
  void _updateConsultantProfile() {
    // Implement the logic to update the consultant profile details
    // Use Firebase Firestore to store data
    FirebaseFirestore.instance
        .collection('consultants')
        .doc('consultant_id')
        .set({
      'skills': _skillsController.text,
      'portfolio': _portfolioController.text,
      'availability': _availabilityController.text,
    });

    // Show a snackbar to indicate success
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Consultant profile updated successfully!'),
        duration: Duration(seconds: 2),
      ),
    );

    // Clear the form after updating
    _formKey.currentState?.reset();
  }
}
