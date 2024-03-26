import 'package:flutter/material.dart';
import 'punch.dart';
import 'leave.dart';
import 'details.dart';
import 'view_attendance.dart';

void main() {
  runApp(EmployeePortal());
}

class EmployeePortal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Employee Portal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: EmployeeHomePage(),
    );
  }
}

class EmployeeHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Portal'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to Punch In page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PunchInOutPage()),
                );
              },
              child: Text('Punch In/ Out'),
            ),
            SizedBox(height: 50), // Add a gap of 50 between buttons
            ElevatedButton(
              onPressed: () {
                // Navigate to Attendance Details page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PersonalAttendance()),
                );
              },
              child: Text('View Attendance Details'),
            ),
            SizedBox(height: 50), // Add a gap of 50 between buttons
            ElevatedButton(
              onPressed: () {
                // Navigate to Add Details page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => UpdateDetailsPage()),
                );
              },
              child: Text('Add Details'),
            ),
            SizedBox(height: 50), // Add a gap of 50 between buttons
            ElevatedButton(
              onPressed: () {
                // Navigate to Leave Application page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LeaveApplicationPage()),
                );
              },
              child: Text('Submit Leave Application'),
            ),
          ],
        ),
      ),
    );
  }
}
