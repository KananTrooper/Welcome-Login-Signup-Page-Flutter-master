import 'package:flutter/material.dart';
import 'package:flutter_auth/constants.dart';

class AdminDeleteData extends StatefulWidget {
  const AdminDeleteData({super.key});

  @override
  _AdminDeleteDataState createState() => _AdminDeleteDataState();
}

class _AdminDeleteDataState extends State<AdminDeleteData> {
  // Sample data
  List<String> items = ['Item 1', 'Item 2', 'Item 3'];

  void _deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Delete Data'),
        backgroundColor: kPrimaryColor,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            trailing: IconButton(
              icon: const Icon(Icons.delete, color: Colors.red),
              onPressed: () => _showDeleteConfirmationDialog(index),
            ),
          );
        },
      ),
    );
  }

  void _showDeleteConfirmationDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete "${items[index]}"?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Delete'),
              onPressed: () {
                _deleteItem(index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
