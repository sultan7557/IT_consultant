import 'package:flutter/material.dart';

class ReviewSystem extends StatefulWidget {
  @override
  _ReviewSystemState createState() => _ReviewSystemState();
}

class _ReviewSystemState extends State<ReviewSystem> {
  // Add necessary controllers for handling user input
  TextEditingController _reviewController = TextEditingController();
  TextEditingController _ratingController = TextEditingController();

  // Add a form key for form validation
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review System',
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
                'Write a Review',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800]),
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextFormField(
                      controller: _ratingController,
                      decoration: InputDecoration(
                        labelText: 'Rating',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.grey[100],
                      ),
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the rating';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    flex: 5,
                    child: TextFormField(
                      controller: _reviewController,
                      decoration: InputDecoration(
                        labelText: 'Review',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.grey[100],
                      ),
                      maxLines: 3,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please write a review';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Validate the form before proceeding
                  if (_formKey.currentState?.validate() ?? false) {
                    // Perform actions with the review and rating (e.g., update database)
                    _writeReview();
                  }
                },
                child: Text('Submit Review',
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

  // Method to handle submitting a review and rating
  void _writeReview() {
    // Implement the logic to store the review and rating
    // For simplicity, let's print the review and rating for now
    print('Rating: ${_ratingController.text}');
    print('Review: ${_reviewController.text}');

    // You can add further logic to send this data to a backend server or Firebase
    // Clear the form after submitting
    _formKey.currentState?.reset();
  }
}
