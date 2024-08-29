import 'package:flutter/material.dart';
import 'pages/login_page.dart'; // Import the login page

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page Navigation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(), // Directly navigate to LoginPage
    );
  }
}
