import 'package:flutter/material.dart';

class UpdateDetailsPage extends StatefulWidget {
  @override
  UpdateDetailsPageState createState() => UpdateDetailsPageState();
}

class UpdateDetailsPageState extends State<UpdateDetailsPage> {
  TextEditingController _addressController = TextEditingController();
  TextEditingController _otherDetailsController = TextEditingController();

  String _address = '';
  String _otherDetails = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _addressController,
              decoration: InputDecoration(
                labelText: 'Address',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _address = value;
                });
              },
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _otherDetailsController,
              maxLines: 3,
              decoration: InputDecoration(
                labelText: 'Other Details',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  _otherDetails = value;
                });
              },
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Clear input fields
                    _addressController.clear();
                    _otherDetailsController.clear();
                    // Clear displayed information
                    setState(() {
                      _address = '';
                      _otherDetails = '';
                    });
                  },
                  child: Text('Clear'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle updating details here
                    // You may also navigate back to the previous screen after updating
                    Navigator.pop(context);
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Text(
              'New Address: $_address',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'New Other Details: $_otherDetails',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
