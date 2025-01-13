import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerScreen extends StatefulWidget {
  @override
  _QRScannerScreenState createState() => _QRScannerScreenState();
}

class _QRScannerScreenState extends State<QRScannerScreen>
    with SingleTickerProviderStateMixin {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  AnimationController? animationController;
  Animation<double>? animation;

  @override
  void initState() {
    super.initState();

    // สร้าง Animation Controller สำหรับแถบสีแดง
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);

    // กำหนดให้ animation เคลื่อนที่ขึ้น-ลง
    animation = Tween<double>(begin: 0, end: 1).animate(animationController!);
  }

  @override
  void dispose() {
    controller?.dispose();
    animationController?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      Navigator.pop(context, scanData.code); // ส่งผลลัพธ์กลับเมื่อสแกนสำเร็จ
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("สแกน QR Code")),
      body: Stack(
        children: [
          // ตัวแสดงกล้อง
          QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
          ),
          // แถบสีแดงเคลื่อนที่ผ่านหน้าสแกน
          Positioned.fill(
            child: AnimatedBuilder(
              animation: animation!,
              builder: (context, child) {
                return Positioned(
                  top: MediaQuery.of(context).size.height * 0.3 +
                      (MediaQuery.of(context).size.height *
                          0.2 *
                          animation!.value),
                  left: 50,
                  right: 50,
                  child: Container(
                    height: 4,
                    color: Colors.red,
                  ),
                );
              },
            ),
          ),
          // ข้อความแนะนำด้านล่าง
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'กรุณาวาง QR Code ไว้ในกรอบเพื่อสแกน',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
