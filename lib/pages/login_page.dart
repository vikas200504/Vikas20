import 'package:flutter/material.dart';
import 'home_page.dart'; // Import HomePage
import 'signup_page.dart'; // Import SignUpPage

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _emailError;

  void _login() {
    String email = _emailController.text;

    setState(() {
      if (email.isEmpty || !email.contains('@')) {
        _emailError = 'Invalid email address';
      } else {
        _emailError = null;
        // Navigate to HomePage if email is valid
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Text(
                'LOGIN',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 17),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: 'Enter email',
                  border: InputBorder.none,
                  errorText: _emailError, // Display error message
                ),
              ),
            ),
            if (_emailError != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  _emailError!,
                  style: TextStyle(color: Colors.red),
                ),
              ),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: _login,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Button color
              ),
              child: Text(
                'LOGIN',
                style: TextStyle(color: Colors.white), // Button text color
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: GestureDetector(
                onTap: () {
                  // Navigate to SignUpPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  );
                },
                child: Text(
                  "Don't have an account? Sign UP",
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
