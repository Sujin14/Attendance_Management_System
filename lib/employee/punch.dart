import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Punch In/Out',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PunchInOutPage(),
    );
  }
}

class PunchInOutPage extends StatefulWidget {
  PunchInOutPage({Key? key}) : super(key: key);

  @override
  _PunchInOutPageState createState() => _PunchInOutPageState();
}

class _PunchInOutPageState extends State<PunchInOutPage> {
  String _punchStatus = 'Not punched';

  void _punchIn() {
    setState(() {
      _punchStatus = 'Punched In';
    });
  }

  void _punchOut() {
    setState(() {
      _punchStatus = 'Punched Out';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Punch In/Out'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Punch Status: $_punchStatus',
              style: TextStyle(fontSize: 20.0),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _punchIn,
              child: Text('Punch In'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: _punchOut,
              child: Text('Punch Out'),
            ),
          ],
        ),
      ),
    );
  }
}
