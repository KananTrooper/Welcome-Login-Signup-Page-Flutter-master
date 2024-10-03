import 'package:flutter/material.dart';

class UserPatientScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ข้อมูลผู้ป่วย'),
        backgroundColor: const Color.fromARGB(255, 184, 66, 231),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // กรอบสีขาวสำหรับแสดงข้อมูลผู้ป่วยที่มีความกว้างแคบลง
            Container(
              width: MediaQuery.of(context).size.width *
                  0.8, // กำหนดความกว้างของกรอบให้แคบลง (80% ของหน้าจอ)
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white, // พื้นหลังสีขาว
                border: Border.all(
                  color: Colors.grey, // สีของกรอบ
                  width: 2, // ความหนาของกรอบ
                ),
                borderRadius: BorderRadius.circular(10), // มุมมนของกรอบ
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ชื่อผู้ป่วย: นายสมชาย ใจดี',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'เลขประจำตัวผู้ป่วย: 123456789',
                    style: TextStyle(fontSize: 18),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'วันเกิด: 01 มกราคม 1980',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            Spacer(),
            // ปุ่มกด ขอ QR code
            ElevatedButton(
              onPressed: () {
                // ฟังก์ชันขอ QR code
                print("ขอ QR code");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // สีของปุ่ม
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'ขอ QR code',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
