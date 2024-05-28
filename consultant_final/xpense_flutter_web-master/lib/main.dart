import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:xpense_flutter_web/utils/colors.dart';

import 'pages/authentication/authentication.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  const firebaseConfig = {
    'apiKey': "AIzaSyAtB-PgcRO_1RPSHWnv08qQdEs-p7ihsCw",
    'authDomain': "itsecond-cf1f3.firebaseapp.com",
    'projectId': "itsecond-cf1f3",
    'storageBucket': "itsecond-cf1f3.appspot.com",
    'messagingSenderId': "409376821120",
    'appId': "1:409376821120:web:7b747403316547c344fb65",
    'measurementId': "G-EVRTB861NK"
  };

  await Firebase.initializeApp(
      options: FirebaseOptions(
    apiKey: firebaseConfig['apiKey']!,
    authDomain: firebaseConfig['authDomain']!,
    projectId: firebaseConfig['projectId']!,
    storageBucket: firebaseConfig['storageBucket']!,
    messagingSenderId: firebaseConfig['messagingSenderId']!,
    appId: firebaseConfig['appId']!,
    measurementId: firebaseConfig['measurementId']!,
  ));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Seltn Solutions',
      theme: ThemeData(
        fontFamily: 'HindSiliguri',
        brightness: Brightness.light,
        primaryColor: AppColors.primary,
      ),
      home: AuthenticationPage(),
    );
  }
}
