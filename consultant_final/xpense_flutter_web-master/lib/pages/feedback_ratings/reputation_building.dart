import 'package:flutter/material.dart';

class ReputationBuilding extends StatefulWidget {
  @override
  _ReputationBuildingState createState() => _ReputationBuildingState();
}

class _ReputationBuildingState extends State<ReputationBuilding> {
  // Add necessary controllers for handling user input
  TextEditingController _ratingController = TextEditingController();
  TextEditingController _feedbackController = TextEditingController();

  // Add a form key for form validation
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reputation Building',
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
                'Provide Feedback and Ratings',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800]),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _ratingController,
                decoration: InputDecoration(
                  labelText: 'Rating',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the rating';
                  }
                  return null;
                },
                keyboardType: TextInputType.number, // Allow only numeric input
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _feedbackController,
                decoration: InputDecoration(
                  labelText: 'Feedback',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please provide feedback';
                  }
                  return null;
                },
                maxLines: 3, // Allow multiple lines for feedback
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Validate the form before proceeding
                  if (_formKey.currentState?.validate() ?? false) {
                    // Perform actions with the feedback and ratings (e.g., update database)
                    _provideFeedback();
                  }
                },
                child: Text('Submit Feedback',
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

  // Method to handle providing feedback and ratings
  void _provideFeedback() {
    // Implement the logic to store the feedback and ratings
    // For simplicity, let's print the feedback and ratings for now
    print('Rating: ${_ratingController.text}');
    print('Feedback: ${_feedbackController.text}');

    // You can add further logic to send this data to a backend server or Firebase
    // Clear the form after providing feedback
    _formKey.currentState?.reset();
  }
}
