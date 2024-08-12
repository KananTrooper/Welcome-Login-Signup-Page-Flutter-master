import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Admin/components/Admin_add_data.dart';
import 'package:flutter_auth/constants.dart';

class AdminWindow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: Text('Admin Window'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return AdminAddData();
                        },
                      ),
                    );
                  },
                  child: Text('Add Data'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Add data functionality
                    print('Add button pressed');
                  },
                  child: Text('Add'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Edit data functionality
                    print('Edit button pressed');
                  },
                  child: Text('Edit'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Delete data functionality
                    print('Delete button pressed');
                  },
                  child: Text('Delete'),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.all(16.0),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
