import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Leave Application System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LeaveApplicationPage(),
    );
  }
}

class LeaveApplicationPage extends StatefulWidget {
  @override
  _LeaveApplicationPageState createState() => _LeaveApplicationPageState();
}

class _LeaveApplicationPageState extends State<LeaveApplicationPage> {
  List<LeaveApplication> leaveApplications = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Leave Application System'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: _submitLeaveRequest,
              child: Text('Submit Leave Request'),
            ),
          ),
          SizedBox(height: 20.0),
          Text(
            'Leave Application Status:',
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          Expanded(
            child: ListView.builder(
              itemCount: leaveApplications.length,
              itemBuilder: (context, index) {
                final application = leaveApplications[index];
                return ListTile(
                  title: Text('Status: ${application.status}'),
                  subtitle: Text('Leave Type: ${application.leaveType}'),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _submitLeaveRequest() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Submit Leave Request'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              DropdownButtonFormField(
                onChanged: (value) {},
                items: ['Vacation', 'Sick Leave', 'Personal'].map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                decoration: InputDecoration(labelText: 'Leave Type'),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // Simulate submitting leave request
                  setState(() {
                    leaveApplications.add(
                      LeaveApplication(
                        leaveType: 'Vacation', // Get leave type from dropdown
                        status: LeaveStatus.pending,
                      ),
                    );
                  });
                  Navigator.pop(context); // Close dialog
                },
                child: Text('Submit'),
              ),
            ],
          ),
        );
      },
    );
  }
}

enum LeaveStatus {
  pending,
  approved,
  rejected,
}

class LeaveApplication {
  final String leaveType;
  final LeaveStatus status;

  LeaveApplication({required this.leaveType, required this.status});
}
