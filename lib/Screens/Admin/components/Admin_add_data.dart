import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Admin/components/Admin_window.dart';
import 'package:flutter_auth/constants.dart';
import 'package:flutter_auth/model/patientdata.dart';

class AdminAddData extends StatefulWidget {
  const AdminAddData({Key? key}) : super(key: key);

  @override
  _AdminAddDataState createState() => _AdminAddDataState();
}

class _AdminAddDataState extends State<AdminAddData> {
  String? _selectedGender;
  DateTime? _selectedDate;
  String? _selectedMaritalStatus;
  String? _selectedEducationStatus;
  String? _selectedPrefix;
  String? _selectedBloodGroup;

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _subDistrictController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _relativePhoneController =
      TextEditingController();
  final TextEditingController _medicalConditionController =
      TextEditingController();
  final TextEditingController _drugAllergyController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  void _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _calculateAge(picked);
      });
    }
  }

  void _calculateAge(DateTime birthDate) {
    final DateTime today = DateTime.now();
    int age = today.year - birthDate.year;
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }
    _ageController.text = '$age';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 500.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      "เพิ่มข้อมูลผู้ป่วย",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // ปุ่มเพิ่มรูปภาพ
                    ElevatedButton(
                      onPressed: () {
                        // โค้ดสำหรับเพิ่มรูปภาพ
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text(
                        "เพิ่มรูปภาพ",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // ตัวเลือกคำนำหน้าชื่อ
                    Row(
                      children: [
                        DropdownButton<String>(
                          value: _selectedPrefix,
                          hint: const Text("นาย/นาง/นางสาว"),
                          items: <String>[
                            'นาย',
                            'นาง',
                            'นางสาว',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedPrefix = newValue;
                            });
                          },
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child:
                              _buildTextField(_nameController, "ชื่อผู้ป่วย"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // บรรทัดที่ 2: เพศและวันเดือนปีเกิด
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                "เพศ",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: <Widget>[
                                  const Text("ชาย"),
                                  Radio<String>(
                                    value: 'ชาย',
                                    groupValue: _selectedGender,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _selectedGender = value;
                                      });
                                    },
                                  ),
                                  const SizedBox(width: 10),
                                  const Text("หญิง"),
                                  Radio<String>(
                                    value: 'หญิง',
                                    groupValue: _selectedGender,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _selectedGender = value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 3,
                          child: ElevatedButton(
                            onPressed: () => _selectDate(context),
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.white,
                              minimumSize: const Size(double.infinity, 50),
                              elevation: 2,
                            ),
                            child: Text(
                              _selectedDate == null
                                  ? 'เลือกวัน/เดือน/ปี'
                                  : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // บรรทัดที่ 3: สถานะสมรสและสถานะการศึกษา
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                "สถานะสมรส",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: <Widget>[
                                  const Text("โสด"),
                                  Radio<String>(
                                    value: 'โสด',
                                    groupValue: _selectedMaritalStatus,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _selectedMaritalStatus = value;
                                      });
                                    },
                                  ),
                                  const SizedBox(width: 10),
                                  const Text("สมรส"),
                                  Radio<String>(
                                    value: 'สมรส',
                                    groupValue: _selectedMaritalStatus,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _selectedMaritalStatus = value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const Text(
                                "สถานะการศึกษา",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              DropdownButton<String>(
                                value: _selectedEducationStatus,
                                hint: const Text("เลือกสถานะการศึกษา"),
                                items: <String>[
                                  'ประถมศึกษา',
                                  'มัธยมศึกษา',
                                  'ปริญญาตรี',
                                  'ปริญญาโท',
                                  'ปริญญาเอก'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedEducationStatus = newValue;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // ปุ่มเลือกกรุ๊ปเลือด
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "กรุ๊ปเลือด",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        DropdownButton<String>(
                          value: _selectedBloodGroup,
                          hint: const Text("เลือกกรุ๊ปเลือด"),
                          items: <String>[
                            'A',
                            'B',
                            'AB',
                            'O',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              _selectedBloodGroup = newValue;
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // ช่องกรอกโรคประจำตัว
                    _buildTextField(_medicalConditionController, "โรคประจำตัว"),
                    const SizedBox(height: 20),

                    // ช่องกรอกประวัติแพ้ยา
                    _buildTextField(_drugAllergyController, "ประวัติแพ้ยา"),
                    const SizedBox(height: 20),

                    // ส่วนข้อมูลอื่นๆ
                    _buildTextField(_addressController, "ที่อยู่"),
                    const SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: _buildTextField(_cityController, "เมือง"),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: _buildTextField(_districtController, "อำเภอ"),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child:
                              _buildTextField(_subDistrictController, "ตำบล"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // แก้ไขช่องกรอกเบอร์โทรศัพท์ให้มีตัวอย่างแสดง
                    _buildTextField(_phoneController,
                        "เบอร์โทรศัพท์ (ตัวอย่าง: 0812345678)"),
                    const SizedBox(height: 20),

                    // แก้ไขช่องกรอก "ที่อยู่ญาติ" เป็น "เบอร์ติดต่อญาติ"
                    _buildTextField(_relativePhoneController,
                        "เบอร์ติดต่อญาติ (ตัวอย่าง: 0812345678)"),
                    const SizedBox(height: 20),

                    // เพิ่มปุ่ม "ตำแหน่งที่อยู่"
                    ElevatedButton(
                      onPressed: () {
                        // โค้ดสำหรับตำแหน่งที่อยู่
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text(
                        "ตำแหน่งที่อยู่",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // ปุ่มเพิ่มข้อมูล
                    Center(
                      child: SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            // ตรวจสอบว่ามีข้อมูลสำคัญครบถ้วนหรือไม่
                            if (_nameController.text.isNotEmpty &&
                                _selectedGender != null &&
                                _selectedDate != null) {
                              // สร้างอ็อบเจกต์ PatientData
                              final newPatient = PatientData(
                                name: _nameController.text,
                                gender: _selectedGender!,
                                birthDate: _selectedDate!,
                                maritalStatus: _selectedMaritalStatus ?? '',
                                educationStatus: _selectedEducationStatus ?? '',
                                prefix: _selectedPrefix ?? '',
                                bloodGroup: _selectedBloodGroup ?? '',
                                medicalCondition:
                                    _medicalConditionController.text,
                                drugAllergy: _drugAllergyController.text,
                                address: _addressController.text,
                                city: _cityController.text,
                                district: _districtController.text,
                                subDistrict: _subDistrictController.text,
                                phone: _phoneController.text,
                                relativePhone: _relativePhoneController.text,
                              );

                              // ส่งข้อมูลกลับไปยังหน้าก่อนหน้า
                              Navigator.pop(context, newPatient);
                            } else {
                              // แสดงการแจ้งเตือนว่าข้อมูลยังไม่ครบ
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text('กรุณากรอกข้อมูลให้ครบถ้วน'),
                              ));
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 184, 66, 231),
                            elevation: 0,
                            minimumSize: const Size(double.infinity, 50),
                          ),
                          child: const Text(
                            "เพิ่มข้อมูล",
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hintText) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0xFFD3D3D3),
            blurRadius: 20.0,
            offset: Offset(0, 10),
          )
        ],
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        ),
        keyboardType:
            hintText.contains("เบอร์โทรศัพท์") || hintText.contains("อายุ")
                ? TextInputType.number
                : TextInputType.text,
      ),
    );
  }
}
