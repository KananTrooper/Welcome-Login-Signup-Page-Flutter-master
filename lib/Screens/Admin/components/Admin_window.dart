import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Admin/AdminLogin.dart';
import 'package:flutter_auth/Screens/Admin/components/Admin_add_data.dart';
import 'package:flutter_auth/Screens/Admin/components/Admin_delete_data.dart';
import 'package:flutter_auth/Screens/Guest/Guest.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/constants.dart';

class AdminWindow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Admin Window',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: kPrimaryColor,
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
              leading: Icon(Icons.exit_to_app),
              title: Text('ออกจากระบบ'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const WelcomeScreen();
                }));
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle),
              title: Text('แอดมิน'),
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
              leading: Icon(Icons.qr_code),
              title: Text('ผู้เยี่ยมชม'),
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
        padding: const EdgeInsets.all(16.0), // เพิ่ม Padding รอบๆ หน้าจอ
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // แถวของปุ่ม
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 100,
                  height: 50,
                  child: ElevatedButton(
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
                      // เพิ่มข้อมูล
                    },
                    child: Text('เพิ่ม'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue, // สีพื้นหลังของปุ่ม
                    ),
                  ),
                ),
                SizedBox(width: 10), // เพิ่มระยะห่างระหว่างปุ่ม
                SizedBox(
                  width: 100,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // แก้ไขข้อมูล
                    },
                    child: Text('แก้ไข'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange, // สีพื้นหลังของปุ่ม
                    ),
                  ),
                ),
                SizedBox(width: 10), // เพิ่มระยะห่างระหว่างปุ่ม
                SizedBox(
                  width: 100,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return AdminDeleteData();
                          },
                        ),
                      );
                      // ลบข้อมูล
                    },
                    child: Text('ลบ'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // สีพื้นหลังของปุ่ม
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
                height:
                    20), // เพิ่มระยะห่างระหว่างแถวของปุ่มและพื้นที่แสดงข้อมูล
            // พื้นที่แสดงข้อมูลที่สามารถปรับขนาดได้ตามหน้าจอ
            Expanded(
              child: Container(
                width: double.infinity, // ใช้พื้นที่ทั้งหมดที่เหลือใน Column
                color: Colors.white, // สีพื้นหลังของพื้นที่แสดงข้อมูล
                child: Center(
                  child: Text(
                    'ข้อมูลที่จะแสดง',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
