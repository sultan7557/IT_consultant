import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ClientProfile extends StatefulWidget {
  @override
  _ClientProfileState createState() => _ClientProfileState();
}

class _ClientProfileState extends State<ClientProfile> {
  // Add necessary controllers for handling user input
  TextEditingController _projectTitleController = TextEditingController();
  TextEditingController _projectScopeController = TextEditingController();
  TextEditingController _projectBudgetController = TextEditingController();
  TextEditingController _projectTimelineController = TextEditingController();

  // Add a form key for form validation
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Client Profile',
          style:
              TextStyle(color: Colors.blue[800], fontWeight: FontWeight.bold),
        ),
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
                  'Post a New Project',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800]),
                ),
                SizedBox(height: 16),
                Text(
                  'Project Title',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[800]),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _projectTitleController,
                  decoration: InputDecoration(
                    hintText: 'Enter your project title',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.grey[100],
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a project title';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                // Rest of your widgets...
                TextFormField(
                  controller: _projectScopeController,
                  decoration: InputDecoration(
                    hintText: 'Enter the project scope',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.grey[100],
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the project scope';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _projectBudgetController,
                  decoration: InputDecoration(
                    hintText: 'Enter the project budget',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.grey[100],
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the project budget';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _projectTimelineController,
                  decoration: InputDecoration(
                    hintText: 'Enter the project timeline',
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.grey[100],
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the project timeline';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Validate the form before proceeding
                    if (_formKey.currentState?.validate() ?? false) {
                      // Perform actions with the project details (e.g., post to database)
                      _postProject();
                    }
                  },
                  child: Text('Post Project',
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

  // Method to handle posting the project to the database
  void _postProject() async {
    try {
      // Post the project details to the database using Firestore
      await FirebaseFirestore.instance.collection('projects').add({
        'title': _projectTitleController.text,
        'scope': _projectScopeController.text,
        'budget': _projectBudgetController.text,
        'timeline': _projectTimelineController.text,
      });

      // Show a snackbar to indicate success
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Project posted successfully!'),
          duration: Duration(seconds: 2),
        ),
      );

      // Clear the form after posting
      _formKey.currentState?.reset();
    } catch (e) {
      // Handle errors, e.g., show a snackbar or log the error
      print('Error posting project: $e');
    }
  }
}
