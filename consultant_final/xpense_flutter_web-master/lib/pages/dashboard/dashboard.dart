import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:xpense_flutter_web/pages/authentication/authentication.dart';
import 'package:xpense_flutter_web/pages/dashboard/user_profile1.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<String> tasks = ['Task 1', 'Task 2', 'Task 3']; // Sample tasks

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IT Consultant Dashboard'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('User Profile'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('User Profile'),
              onTap: () {
                // Navigate to the UserProfile page when the button is pressed
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UserProfile()),
                );
              },
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                // Update the state of the app
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () async {
                await FirebaseAuth.instance.signOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => AuthenticationPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index]),
          );
        },
      ),
    );
  }
}
