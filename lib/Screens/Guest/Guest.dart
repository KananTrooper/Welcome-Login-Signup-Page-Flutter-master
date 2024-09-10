import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

<<<<<<< Updated upstream:lib/Screens/Guest/Guest.dart
class Guest extends StatelessWidget {
  const Guest({Key? key}) : super(key: key);
=======
class Guert extends StatefulWidget {
  @override
  _QRViewExampleState createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<Guert> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
>>>>>>> Stashed changes:lib/Screens/Guert/Guert.dart

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Scanner'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? Text(
                      'Barcode Type: ${result!.format}   Data: ${result!.code}')
                  : Text('Scan a code'),
            ),
<<<<<<< Updated upstream:lib/Screens/Guest/Guest.dart
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
=======
          )
        ],
>>>>>>> Stashed changes:lib/Screens/Guert/Guert.dart
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
