import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MilestoneTracking extends StatefulWidget {
  @override
  _MilestoneTrackingState createState() => _MilestoneTrackingState();
}

class _MilestoneTrackingState extends State<MilestoneTracking> {
  // Add necessary controllers for handling user input
  TextEditingController _milestoneTitleController = TextEditingController();
  TextEditingController _milestoneDescriptionController =
      TextEditingController();
  TextEditingController _dueDateController = TextEditingController();

  // Add a form key for form validation
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Milestone Tracking',
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
                'Add New Milestone',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800]),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _milestoneTitleController,
                decoration: InputDecoration(
                  labelText: 'Milestone Title',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the milestone title';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _milestoneDescriptionController,
                decoration: InputDecoration(
                  labelText: 'Milestone Description',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the milestone description';
                  }
                  return null;
                },
                maxLines:
                    3, // Allowing multiple lines for better description input
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _dueDateController,
                decoration: InputDecoration(
                  labelText: 'Due Date',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the due date';
                  }
                  return null;
                },
                keyboardType: TextInputType.datetime, // Use a datetime keyboard
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Validate the form before proceeding
                  if (_formKey.currentState?.validate() ?? false) {
                    // Perform actions with the milestone details (e.g., update database)
                    _addMilestone();
                  }
                },
                child: Text('Add Milestone',
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

  // Method to handle adding a new milestone
  void _addMilestone() async {
    try {
      // Add the milestone details to the database using Firestore
      await FirebaseFirestore.instance.collection('milestones').add({
        'milestoneTitle': _milestoneTitleController.text,
        'milestoneDescription': _milestoneDescriptionController.text,
        'dueDate': _dueDateController.text,
      });

      // Show a snackbar to indicate success
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Milestone added successfully!'),
          duration: Duration(seconds: 2),
        ),
      );

      // Clear the form after adding
      _formKey.currentState?.reset();
    } catch (e) {
      // Handle errors, e.g., show a snackbar or log the error
      print('Error adding milestone: $e');
    }
  }
}
