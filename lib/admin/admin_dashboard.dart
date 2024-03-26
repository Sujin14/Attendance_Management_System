import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(AdminDashboard());
}

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Dashboard',
      home: AdminDashboardScreen(),
    );
  }
}

class AdminDashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Admin Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EmployeesListScreen()),
              );
            },
            child: Text('Employee list'),
          ),
          SizedBox(height: 16.0),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EmployeeAttendanceScreen()),
              );
            },
            child: Text('View Employee Attendance'),
          ),
        ],
      ),
    );
  }
}

class EmployeesListScreen extends StatelessWidget {
  final List<Map<String, String>> employees = [
    {
      'id': '1001',
      'name': 'John Doe',
      'address': '123 Main St, City, Country',
      'designation': 'Software Engineer',
    },
    {
      'id': '1002',
      'name': 'Jane Smith',
      'address': '456 Elm St, City, Country',
      'designation': 'Marketing Manager',
    },
    {
      'id': '1003',
      'name': 'Alice Johnson',
      'address': '789 Oak St, City, Country',
      'designation': 'HR Specialist',
    },
    {
      'id': '1004',
      'name': 'Bob Williams',
      'address': '101 Pine St, City, Country',
      'designation': 'Financial Analyst',
    },
    {
      'id': '1005',
      'name': 'Emily Brown',
      'address': '202 Maple St, City, Country',
      'designation': 'Sales Executive',
    },
    {
      'id': '1006',
      'name': 'Michael Davis',
      'address': '303 Cedar St, City, Country',
      'designation': 'Customer Support Representative',
    },
    {
      'id': '1007',
      'name': 'Jessica Wilson',
      'address': '404 Birch St, City, Country',
      'designation': 'Operations Manager',
    },
    {
      'id': '1008',
      'name': 'David Martinez',
      'address': '505 Walnut St, City, Country',
      'designation': 'Systems Analyst',
    },
    {
      'id': '1009',
      'name': 'Sarah Taylor',
      'address': '606 Elmwood St, City, Country',
      'designation': 'Research Scientist',
    },
    {
      'id': '1010',
      'name': 'Chris Anderson',
      'address': '707 Cedarwood St, City, Country',
      'designation': 'Quality Assurance Engineer',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employees List'),
      ),
      body: ListView.builder(
        itemCount: employees.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(employees[index]['name'] ?? ''),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Employee ID: ${employees[index]['id'] ?? ''}'),
                Text('Address: ${employees[index]['address'] ?? ''}'),
                Text('Designation: ${employees[index]['designation'] ?? ''}'),
              ],
            ),
          );
        },
      ),
    );
  }
}

class EmployeeAttendanceScreen extends StatelessWidget {
  final List<Map<String, String>> employees = [
    {
      'id': '1001',
      'name': 'John Doe',
      'address': '123 Main St, City, Country',
      'designation': 'Software Engineer',
    },
    {
      'id': '1002',
      'name': 'Jane Smith',
      'address': '456 Elm St, City, Country',
      'designation': 'Marketing Manager',
    },
    {
      'id': '1003',
      'name': 'Alice Johnson',
      'address': '789 Oak St, City, Country',
      'designation': 'HR Specialist',
    },
    {
      'id': '1004',
      'name': 'Bob Williams',
      'address': '101 Pine St, City, Country',
      'designation': 'Financial Analyst',
    },
    {
      'id': '1005',
      'name': 'Emily Brown',
      'address': '202 Maple St, City, Country',
      'designation': 'Sales Executive',
    },
    {
      'id': '1006',
      'name': 'Michael Davis',
      'address': '303 Cedar St, City, Country',
           'designation': 'Customer Support Representative',
    },
    {
      'id': '1007',
      'name': 'Jessica Wilson',
      'address': '404 Birch St, City, Country',
      'designation': 'Operations Manager',
    },
    {
      'id': '1008',
      'name': 'David Martinez',
      'address': '505 Walnut St, City, Country',
      'designation': 'Systems Analyst',
    },
    {
      'id': '1009',
      'name': 'Sarah Taylor',
      'address': '606 Elmwood St, City, Country',
      'designation': 'Research Scientist',
    },
    {
      'id': '1010',
      'name': 'Chris Anderson',
      'address': '707 Cedarwood St, City, Country',
      'designation': 'Quality Assurance Engineer',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee Attendance'),
      ),
      body: ListView.builder(
        itemCount: employees.length,
        itemBuilder: (context, index) {
          int totalWorkingDays = Random().nextInt(30) + 1;
          int presentDays = Random().nextInt(totalWorkingDays + 1);
          int leaves = totalWorkingDays - presentDays;
          return ListTile(
            title: Text(employees[index]['name'] ?? ''),
            subtitle: Text(
              'Total Working Days: $totalWorkingDays | Present Days: $presentDays | Leaves: $leaves',
            ),
          );
        },
      ),
    );
  }
}

