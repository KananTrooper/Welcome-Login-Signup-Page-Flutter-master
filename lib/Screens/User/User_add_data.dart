import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/User/User_patient.dart';
import 'package:flutter_auth/constants.dart';

class UserAddData extends StatefulWidget {
  @override
  _UserAddDataState createState() => _UserAddDataState();
}

class _UserAddDataState extends State<UserAddData> {
  // ตัวแปรสำหรับเก็บข้อมูลจาก TextFields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  @override
  void dispose() {
    // เคลียร์ TextFields เมื่อจบการทำงานของหน้าจอ
    _nameController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('กรอกข้อมูล'),
        backgroundColor: const Color.fromARGB(255, 184, 66, 231),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'กรอกข้อมูล',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),

            // ช่องแสดงรูปบุคคล
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(
                    'assets/profile_placeholder.png'), // เปลี่ยนเป็น path ของรูปภาพโปรไฟล์
                backgroundColor: Colors.grey[200],
              ),
            ),
            SizedBox(height: 16),

            // ช่องใส่ชื่อ-นามสกุล
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'ชื่อ-นามสกุล',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // ช่องใส่เบอร์โทร
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'เบอร์โทร',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            // ปุ่มกดขอข้อมูล
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return UserPatientScreen();
                      },
                    ),
                  );

                  // ทำการขอข้อมูลหรือบันทึกข้อมูล
                  final name = _nameController.text;
                  final phone = _phoneController.text;

                  // ตรวจสอบว่าได้กรอกข้อมูลครบหรือไม่
                  if (name.isEmpty || phone.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('กรุณากรอกข้อมูลให้ครบถ้วน')),
                    );
                  } else {
                    // ทำการส่งข้อมูลหรือบันทึกข้อมูล
                    print('ชื่อ: $name');
                    print('เบอร์โทร: $phone');
                  }
                },
                child: Text('ขอข้อมูล'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
