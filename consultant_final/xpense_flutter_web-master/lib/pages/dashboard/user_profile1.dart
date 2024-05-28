import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _contactController = TextEditingController();
  Uint8List? _selectedFile;
  String? _selectedFileUrl;

  Future<DocumentSnapshot> getUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      return FirebaseFirestore.instance.collection('users').doc(user.uid).get();
    }
    throw Exception('No user logged in');
  }

  @override
  void dispose() {
    _nameController.dispose();
    _contactController.dispose();
    super.dispose();
  }

  void _selectFile() {
    final input = html.FileUploadInputElement();
    input.click();

    input.onChange.listen((event) async {
      final file = input.files!.first;
      final reader = html.FileReader();
      reader.readAsArrayBuffer(file);
      reader.onLoadEnd.listen((event) async {
        _selectedFile = reader.result as Uint8List;
        setState(() {});
      });
    });
  }

  Future<void> _uploadImage() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null && _selectedFile != null) {
      try {
        final ref = FirebaseStorage.instance
            .ref()
            .child('user_images')
            .child(user.uid + '.jpg');

        await ref.putData(_selectedFile!);

        final url = await ref.getDownloadURL();

        _selectedFileUrl = url; // Set the URL of the uploaded file

        // Clear the selected file
        _selectedFile = null;

        // Show a success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Image successfully uploaded!')),
        );

        setState(() {}); // Rebuild the widget with the new image URL
      } catch (e) {
        // Show an error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error uploading image: $e')),
        );
      }
    }
  }

  Future<void> _submitForm() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      try {
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .update({
          'image_url': _selectedFileUrl,
          'name': _nameController.text, // Save the name entered by the user
          'contact': _contactController
              .text, // Save the contact information entered by the user
        });

        // Clear the form
        _nameController.clear();
        _contactController.clear();
        _selectedFileUrl = null;

        // Show a success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Data successfully saved!')),
        );

        setState(() {}); // Rebuild the widget
      } catch (e) {
        // Show an error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving data: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: getUserData(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          if (snapshot.data != null) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            _nameController.text = data['name'] ?? '';
            _contactController.text = data['contact'] ?? '';
          }
          return Scaffold(
            appBar: AppBar(
              title: Text('User Profile'),
              backgroundColor: Colors.blue,
            ),
            body: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(color: Colors.grey),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _contactController,
                    decoration: InputDecoration(
                      labelText: 'Contact',
                      labelStyle: TextStyle(color: Colors.grey),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your contact information';
                      }
                      return null;
                    },
                  ),
                  (SizedBox(height: 20)),
                  ElevatedButton(
                    onPressed: _selectFile,
                    child: Text('Pick Image'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, // background
                      onPrimary: Colors.white, // foreground
                    ),
                  ),
                  if (_selectedFile != null && _selectedFileUrl != null)
                    Image.network(_selectedFileUrl!),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _uploadImage();
                      }
                    },
                    child: Text('Submit'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue, // background
                      onPrimary: Colors.white, // foreground
                    ),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
// class _UserProfileState extends State<UserProfile> {
//   late Future<DocumentSnapshot> userData;

//   @override
//   void initState() {
//     super.initState();
//     userData = getUserData();
//   }

//   Future<DocumentSnapshot> getUserData() async {
//     final user = FirebaseAuth.instance.currentUser;
//     if (user != null) {
//       return FirebaseFirestore.instance.collection('users').doc(user.uid).get();
//     }
//     throw Exception('No user logged in');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<DocumentSnapshot>(
//       future: userData,
//       builder:
//           (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return CircularProgressIndicator();
//         } else if (snapshot.hasError) {
//           return Text('Error: ${snapshot.error}');
//         } else {
//           Map<String, dynamic> data =
//               snapshot.data?.data() as Map<String, dynamic>;
//           return Scaffold(
//             appBar: AppBar(
//               title: Text('User Profile'),
//               backgroundColor: Colors.blue,
//             ),
//             body: Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   Container(
//                     padding: EdgeInsets.all(8.0),
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.blue),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Text('Name: ${data['name']}',
//                         style: TextStyle(fontSize: 18, color: Colors.blue)),
//                   ),
//                   SizedBox(height: 20),
//                   Container(
//                     padding: EdgeInsets.all(8.0),
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.blue),
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Text('Email: ${data['email']}',
//                         style: TextStyle(fontSize: 18, color: Colors.blue)),
//                   ),
//                   SizedBox(height: 20),
//                 ],
//               ),
//             ),
//           );
//         }
//       },
//     );
//   }
// }
