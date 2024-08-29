import 'package:flutter/material.dart';
import 'home_page.dart';
import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  String? _emailError;
  String? _passwordError;

  void _signUp() {
    String email = _emailController.text;
    String password = _passwordController.text;
    String confirmPassword = _confirmPasswordController.text;

    setState(() {
      if (email.isEmpty || !email.contains('@')) {
        _emailError = 'Invalid email address';
      } else {
        _emailError = null;
      }

      if (password != confirmPassword) {
        _passwordError = 'Passwords do not match';
      } else {
        _passwordError = null;
      }

      if (_emailError == null && _passwordError == null) {
        // Navigate to HomePage if everything is valid
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
        title: Text('Sign Up Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Text(
                'Sign Up',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: 'Name',
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 12),
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
                  hintText: 'Email',
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
            SizedBox(height: 12),
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
            SizedBox(height: 12),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: TextField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  border: InputBorder.none,
                  errorText: _passwordError, // Display password match error
                ),
              ),
            ),
            if (_passwordError != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  _passwordError!,
                  style: TextStyle(color: Colors.red),
                ),
              ),
            SizedBox(height: 12),
            ElevatedButton(
              onPressed: _signUp,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Button color
              ),
              child: Text(
                'SIGN UP',
                style: TextStyle(color: Colors.white), // Button text color
              ),
            ),
            SizedBox(height: 12),
            Center(
              child: GestureDetector(
                onTap: () {
                  // Navigate to LoginPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                },
                child: Text(
                  "Already have an account? Login",
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
