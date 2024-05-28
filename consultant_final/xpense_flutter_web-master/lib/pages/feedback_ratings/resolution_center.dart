import 'package:flutter/material.dart';

class ResolutionCenter extends StatefulWidget {
  @override
  _ResolutionCenterState createState() => _ResolutionCenterState();
}

class _ResolutionCenterState extends State<ResolutionCenter> {
  // Add necessary controllers for handling user input
  TextEditingController _issueDescriptionController = TextEditingController();
  TextEditingController _proposedSolutionController = TextEditingController();

  // Add a form key for form validation
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resolution Center',
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
                'Report an Issue',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800]),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _issueDescriptionController,
                decoration: InputDecoration(
                  labelText: 'Issue Description',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please describe the issue';
                  }
                  return null;
                },
                maxLines: 3, // Allow multiple lines for issue description
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _proposedSolutionController,
                decoration: InputDecoration(
                  labelText: 'Proposed Solution',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please propose a solution';
                  }
                  return null;
                },
                maxLines: 3, // Allow multiple lines for proposed solution
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Validate the form before proceeding
                  if (_formKey.currentState?.validate() ?? false) {
                    // Perform actions with the issue details (e.g., initiate resolution process)
                    _reportIssue();
                  }
                },
                child:
                    Text('Report Issue', style: TextStyle(color: Colors.white)),
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

  // Method to handle reporting an issue to the resolution center
  void _reportIssue() {
    // Implement the logic to report the issue to the resolution center
    // For simplicity, let's print the issue details for now
    print('Issue Description: ${_issueDescriptionController.text}');
    print('Proposed Solution: ${_proposedSolutionController.text}');

    // You can add further logic to send this data to a backend server or Firebase
    // Clear the form after reporting
    _formKey.currentState?.reset();
  }
}
