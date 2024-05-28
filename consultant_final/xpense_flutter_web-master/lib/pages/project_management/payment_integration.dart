import 'package:flutter/material.dart';

class PaymentIntegration extends StatefulWidget {
  @override
  _PaymentIntegrationState createState() => _PaymentIntegrationState();
}

class _PaymentIntegrationState extends State<PaymentIntegration> {
  // Add necessary controllers for handling user input
  TextEditingController _amountController = TextEditingController();
  TextEditingController _cardNumberController = TextEditingController();
  TextEditingController _expiryDateController = TextEditingController();
  TextEditingController _cvvController = TextEditingController();

  // Add a form key for form validation
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Integration',
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
                'Make a Payment',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[800]),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _amountController,
                decoration: InputDecoration(
                  labelText: 'Amount',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the payment amount';
                  }
                  return null;
                },
                keyboardType: TextInputType.numberWithOptions(
                    decimal: true), // Allow only numeric input
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _cardNumberController,
                decoration: InputDecoration(
                  labelText: 'Card Number',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[100],
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the card number';
                  }
                  return null;
                },
                keyboardType: TextInputType.number, // Allow only numeric input
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _expiryDateController,
                      decoration: InputDecoration(
                        labelText: 'Expiry Date',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.grey[100],
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the expiry date';
                        }
                        return null;
                      },
                      keyboardType:
                          TextInputType.datetime, // Use a datetime keyboard
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      controller: _cvvController,
                      decoration: InputDecoration(
                        labelText: 'CVV',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.grey[100],
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the CVV';
                        }
                        return null;
                      },
                      keyboardType:
                          TextInputType.number, // Allow only numeric input
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Validate the form before proceeding
                  if (_formKey.currentState?.validate() ?? false) {
                    // Perform actions with the payment details (e.g., process payment)
                    _processPayment();
                  }
                },
                child:
                    Text('Make Payment', style: TextStyle(color: Colors.white)),
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

  // Method to handle processing the payment
  void _processPayment() {
    // Implement the logic to process the payment
    // For simplicity, let's print the payment details for now
    print('Amount: ${_amountController.text}');
    print('Card Number: ${_cardNumberController.text}');
    print('Expiry Date: ${_expiryDateController.text}');
    print('CVV: ${_cvvController.text}');

    // You can add further logic to send this data to a payment gateway or backend server
    // Clear the form after processing
    _formKey.currentState?.reset();
  }
}
