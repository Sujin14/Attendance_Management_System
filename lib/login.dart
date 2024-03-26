import 'package:flutter/material.dart';
import 'sign_up.dart';
import 'admin/admin_dashboard.dart';
import 'employee/employee_dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login Screen',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Login(),
    );
  }
}

class Login extends StatelessWidget {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _mobileNumberController = TextEditingController();
  final _employeeIdController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Screen'),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.blue,
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Username',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                  filled: true,
                  fillColor: Colors.white,
                ),
                obscureText: true,
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  filled: true,
                  fillColor: Colors.white,
                ),
                obscureText: true,
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _mobileNumberController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  labelText: 'Mobile Number',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: _employeeIdController,
                decoration: InputDecoration(
                  labelText: 'Employee ID',
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    child: Text('Clear'),
                    onPressed: () {
                      _usernameController.clear();
                      _passwordController.clear();
                      _confirmPasswordController.clear();
                      _mobileNumberController.clear();
                      _employeeIdController.clear();
                    },
                  ),
                  ElevatedButton(
                    child: Text('Login'),
                    onPressed: () {
                      // Validate input fields
                      String username = _usernameController.text;
                      String password = _passwordController.text;
                      String confirmPassword = _confirmPasswordController.text;
                      String mobileNumber = _mobileNumberController.text;
                      String employeeId = _employeeIdController.text;

                      // Validate mobile number
                      if (mobileNumber.length != 10 || !RegExp(r'^[0-9]+$').hasMatch(mobileNumber)) {
                        _showAlert(context, 'Invalid Mobile Number', 'Mobile number should be a 10-digit number.');
                        return;
                      }

                      // Validate password
                      if (!passwordsMatch(password, confirmPassword)) {
                        _showAlert(context, 'Password Mismatch', 'Password and Confirm Password do not match.');
                        return;
                      }

                      // Validate username
                      if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(username)) {
                        _showAlert(context, 'Invalid Username', 'Username should only contain letters, numbers, or underscores.');
                        return;
                      }

                      // Determine navigation based on employee ID
                      if (employeeId.startsWith('emp')) {
                        // Navigate to employee interface
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EmployeePortal()),
                        );
                      } else if (employeeId.startsWith('adm')) {
                        // Navigate to admin interface
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AdminDashboard()),
                        );
                      }
                    },
                  ),
                ],
              ),
              SizedBox(height: 300.0),
              Text(
                "Don't have an account?",
                style: TextStyle(fontSize: 16),
              ),
              ElevatedButton(
                onPressed: () {
                  // Navigate to sign-up page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUpPage()),
                  );
                },
                child: Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 16, color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAlert(BuildContext context, String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  bool passwordsMatch(String password, String confirmPassword) {
    return password == confirmPassword;
  }
}
