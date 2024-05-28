import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BiddingSystem extends StatefulWidget {
  @override
  _BiddingSystemState createState() => _BiddingSystemState();
}

class _BiddingSystemState extends State<BiddingSystem> {
  // Add necessary controllers for handling user input
  TextEditingController _projectTitleController = TextEditingController();
  TextEditingController _projectDescriptionController = TextEditingController();
  TextEditingController _bidAmountController = TextEditingController();

  // Add a form key for form validation
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bidding System',
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
                'Submit Bid for Project',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800]),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _projectTitleController,
                decoration: InputDecoration(
                  labelText: 'Project Title',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the project title';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _projectDescriptionController,
                decoration: InputDecoration(
                  labelText: 'Project Description',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the project description';
                  }
                  return null;
                },
                maxLines:
                    3, // Allowing multiple lines for better description input
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _bidAmountController,
                decoration: InputDecoration(
                  labelText: 'Bid Amount',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your bid amount';
                  }
                  return null;
                },
                keyboardType:
                    TextInputType.number, // Allowing only numeric input
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Validate the form before proceeding
                  if (_formKey.currentState?.validate() ?? false) {
                    // Perform actions with the bid details (e.g., submit to database)
                    _submitBid();
                  }
                },
                child:
                    Text('Submit Bid', style: TextStyle(color: Colors.white)),
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

  // Method to handle submitting a bid for the project
  void _submitBid() async {
    try {
      // Submit the bid details to the database using Firestore
      await FirebaseFirestore.instance.collection('bids').add({
        'projectTitle': _projectTitleController.text,
        'projectDescription': _projectDescriptionController.text,
        'bidAmount': _bidAmountController.text,
      });

      // Show a snackbar to indicate success
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Bid submitted successfully!'),
          duration: Duration(seconds: 2),
        ),
      );

      // Clear the form after submitting
      _formKey.currentState?.reset();
    } catch (e) {
      // Handle errors, e.g., show a snackbar or log the error
      print('Error submitting bid: $e');
    }
  }
}
