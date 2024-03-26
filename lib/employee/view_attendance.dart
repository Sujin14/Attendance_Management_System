import 'package:flutter/material.dart';

class PersonalAttendance extends StatefulWidget {
  @override
  PersonalAttendanceState createState() => PersonalAttendanceState();
}

class PunchRecord {
  final DateTime punchIn;
  final DateTime punchOut;

  PunchRecord({required this.punchIn, required this.punchOut});
}

class PersonalAttendanceState extends State<PersonalAttendance> {
  List<PunchRecord> punchRecords = [
    PunchRecord(
      punchIn: DateTime(2024, 3, 20, 8, 0), // Example punch in time
      punchOut: DateTime(2024, 3, 20, 17, 30), // Example punch out time
    ),
    PunchRecord(
      punchIn: DateTime(2024, 3, 21, 8, 15),
      punchOut: DateTime(2024, 3, 21, 18, 0),
    ),
    // Add more punch records here
  ];

  @override
  Widget build(BuildContext context) {
    int totalDaysWorked = punchRecords.length;
    int totalLeavesTaken = 0;
    Duration totalHoursWorked = Duration();

    for (var record in punchRecords) {
      if (record.punchOut.isAfter(record.punchIn)) {
        totalHoursWorked += record.punchOut.difference(record.punchIn);
      } else {
        // Handle invalid punch records where punch out is before punch in
        // You may want to display an error or handle it differently
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Attendance'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Punch History:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Expanded(
              child: ListView.builder(
                itemCount: punchRecords.length,
                itemBuilder: (context, index) {
                  final record = punchRecords[index];
                  return ListTile(
                    title: Text(
                      'Punch In: ${record.punchIn.toString()} \n Punch Out: ${record.punchOut.toString()}',
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Total Days Worked: $totalDaysWorked',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Total Leaves Taken: $totalLeavesTaken',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Total Hours Worked: ${totalHoursWorked.inHours} hours and ${totalHoursWorked.inMinutes.remainder(60)} minutes',
              style: TextStyle(fontSize: 18.0),
            ),
          ],
        ),
      ),
    );
  }
}
