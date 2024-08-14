import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Admin/AdminLogin.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';

class Guest extends StatelessWidget {
  const Guest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 184, 66, 231),
        // title: Text(
        // 'WELCOME TO (แอปพลิเคชันช่วยหาเส้นทางกลับบ้านของผู้ป่วยอัลไซเมอร์ด้วยคิวอาร์โค้ด)'),
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
                  color: Color.fromRGBO(255, 255, 255, 1),
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
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/QR-code.jpg',
              height: 400, // ปรับขนาดรูปภาพตามต้องการ
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.pop(context); // ย้อนกลับไปหน้าก่อนหน้า
              },
              child: const Text('ย้อนกลับ'),
            ),
          ],
        ),
      ),
    );
  }
}
