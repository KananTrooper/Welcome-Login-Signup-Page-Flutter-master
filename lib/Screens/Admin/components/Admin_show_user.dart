import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Admin/AdminLogin.dart';
import 'package:flutter_auth/Screens/Guest/Guest.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/model/userdata.dart';

class AdminShowUser extends StatelessWidget {
  final List<Userdata> users; // A list to display multiple users

  AdminShowUser({required this.users});

  @override
  Widget build(BuildContext context) {
    // Get screen size
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text('Admin - ผู้ใช้'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'images/9ac210683e3fdbae7d5e8af81befc692.jpg'),
                    fit: BoxFit.cover),
                color: Color.fromARGB(255, 184, 66, 231),
              ),
              child: Text(
                'เมนู',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.exit_to_app),
              title: const Text('ออกจากระบบ'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const WelcomeScreen();
                }));
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('แอดมิน'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AdminLogin();
                    },
                  ),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.qr_code),
              title: const Text('ผู้เยี่ยมชม'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return const Guest();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: users.length, // Loop through the list of users
          itemBuilder: (context, index) {
            final user = users[index];
            return Card(
              key: ValueKey(user), // Unique key for each user card
              elevation: 3,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Align items to the left
                  children: [
                    Row(
                      children: [
                        // Profile photo
                        CircleAvatar(
                          radius: screenSize.width *
                              0.075, // Adjust size based on screen width
                          backgroundImage: NetworkImage(user.imageUrl),
                        ),
                        const SizedBox(width: 10),
                        // Name and Phone
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                user.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: screenSize.width *
                                      0.04, // Adjust font size based on screen width
                                ),
                                overflow:
                                    TextOverflow.ellipsis, // Prevent overflow
                              ),
                              const SizedBox(height: 4),
                              Text(
                                user.phone,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: screenSize.width *
                                      0.035, // Adjust font size based on screen width
                                ),
                                overflow:
                                    TextOverflow.ellipsis, // Prevent overflow
                              ),
                            ],
                          ),
                        ),
                        // Switch (enabled/disabled)
                        Switch(
                          value: user.isAuthorized,
                          onChanged: (bool value) {
                            // Handle status change
                            // Update the user authorization status here
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    // Approve/Reject buttons in a Column (no more Row)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Approve action
                            // You may call a function to approve the user
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          child: Text(
                            'อนุญาต',
                            style: TextStyle(fontSize: screenSize.width * 0.03),
                          ),
                        ),
                        const SizedBox(height: 5),
                        ElevatedButton(
                          onPressed: () {
                            // Reject action
                            // You may call a function to reject the user
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                          ),
                          child: Text(
                            'ไม่อนุญาต',
                            style: TextStyle(fontSize: screenSize.width * 0.03),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
