import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Admin/AdminLogin.dart';
import 'package:flutter_auth/Screens/Admin/components/Admin_add_data.dart';
import 'package:flutter_auth/Screens/Admin/components/Admin_delete_data.dart';
import 'package:flutter_auth/Screens/Guest/Guest.dart';
import 'package:flutter_auth/Screens/Welcome/welcome_screen.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/model/patientdata.dart';

class AdminWindow extends StatefulWidget {
  const AdminWindow({super.key});

  @override
  _AdminWindowState createState() => _AdminWindowState();
}

class _AdminWindowState extends State<AdminWindow> {
  List<PatientData> patientDataList = [];

  void _addPatientData(PatientData patientData) {
    setState(() {
      patientDataList.add(patientData);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Admin Window',
          style: TextStyle(color: Colors.white),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 100,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () async {
                      final patientData = await Navigator.push<PatientData>(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const AdminAddData();
                          },
                        ),
                      );
                      if (patientData != null) {
                        _addPatientData(patientData);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text('เพิ่ม'),
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: ListView.builder(
                  itemCount: patientDataList.length,
                  itemBuilder: (context, index) {
                    final patient = patientDataList[index];
                    return Card(
                      elevation: 2.0,
                      margin: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ListTile(
                        title: Text('${patient.prefix} ${patient.name}'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'เพศ: ${patient.gender}, อายุ: ${DateTime.now().year - patient.birthDate.year} ปี'),
                            Text('กรุ๊ปเลือด: ${patient.bloodGroup}'),
                            Text(
                                'โรคประจำตัว: ${patient.medicalCondition.isNotEmpty ? patient.medicalCondition : "ไม่มี"}'),
                            Text(
                                'ประวัติแพ้ยา: ${patient.drugAllergy.isNotEmpty ? patient.drugAllergy : "ไม่มี"}'),
                            Text(
                                'ที่อยู่: ${patient.address}, ${patient.city}, ${patient.district}, ${patient.subDistrict}'),
                            Text('เบอร์ติดต่อ: ${patient.phone}'),
                            Text('เบอร์ติดต่อญาติ: ${patient.relativePhone}'),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit, color: Colors.blue),
                              onPressed: () async {
                                final updatedPatient =
                                    await Navigator.push<PatientData>(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const AdminAddData(),
                                    settings: RouteSettings(
                                      arguments:
                                          patient, // ส่งข้อมูลผู้ป่วยไปยังหน้ากรอกข้อมูล
                                    ),
                                  ),
                                );

                                if (updatedPatient != null) {
                                  setState(() {
                                    patientDataList[index] =
                                        updatedPatient; // อัพเดตข้อมูลผู้ป่วย
                                  });
                                }
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                setState(() {
                                  patientDataList.removeAt(index); // ลบข้อมูล
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
