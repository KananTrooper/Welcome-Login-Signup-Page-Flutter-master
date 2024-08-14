import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Admin/components/Admin_add_data.dart';
import 'package:flutter_auth/Screens/Admin/components/Admin_delete_data.dart';
import 'package:flutter_auth/constants.dart';

class AdminWindow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Window'),
        backgroundColor: kPrimaryColor,
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
