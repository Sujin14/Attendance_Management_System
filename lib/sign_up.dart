import 'package:flutter/material.dart';
import 'admin/admin_dashboard.dart'; // Import the AdminDashboard class
import 'employee/employee_dashboard.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _employeeIdController = TextEditingController();
  final TextEditingController _mobileNumberController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  SignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      backgroundColor: Colors.blue, // Set background color to blue
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
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
              controller: _employeeIdController,
              decoration: InputDecoration(
                labelText: 'Employee ID',
                filled: true,
                fillColor: Colors.white,
              ),
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
              controller: _newPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'New Password',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Sign Up'),
              onPressed: () {
                // Validate input fields
                String username = _usernameController.text;
                String password = _newPasswordController.text;
                String mobileNumber = _mobileNumberController.text;
                String employeeId = _employeeIdController.text;
                String confirmPassword = _confirmPasswordController.text;

                // Validate mobile number
                if (mobileNumber.length != 10 || !RegExp(r'^[0-9]+$').hasMatch(mobileNumber)) {
                  _showAlert(context, 'Invalid Mobile Number', 'Mobile number should be a 10-digit number.');
                  return;
                }

                // Validate username
                if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(username)) {
                  _showAlert(context, 'Invalid Username', 'Username should only contain letters, numbers, or underscores.');
                  return;
                }

                // Validate password
                if (password.length < 8) {
                  _showAlert(context, 'Invalid Password', 'The password should not be less than 8 characters.');
                  return;
                }

                // Validate if new password and confirm password match
                if (password != confirmPassword) {
                _showAlert(context, 'Password Mismatch', 'The new password and confirm password do not match.');
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
          actions: <Widget>[
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
}
