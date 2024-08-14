import 'package:flutter/material.dart';
import 'package:flutter_auth/Screens/Admin/components/Admin_window.dart';
import 'package:flutter_auth/constants.dart'; // ตรวจสอบว่ามีการนำเข้า constants.dart

class AdminAddData extends StatefulWidget {
  const AdminAddData({Key? key}) : super(key: key);

  @override
  _AdminAddDataState createState() => _AdminAddDataState();
}

class _AdminAddDataState extends State<AdminAddData> {
  String? _selectedGender;
  DateTime? _selectedDate;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _districtController = TextEditingController();
  final TextEditingController _subDistrictController = TextEditingController();

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
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        //title: Text('เพิ่มข้อมูลผู้ป่วย'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "เพิ่มข้อมูลผู้ป่วย",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "ชื่อผู้ป่วย",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 10),
                _buildTextField(_nameController, "ชื่อผู้ป่วย"),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Text("ชาย"),
                          Radio<String>(
                            value: 'ชาย',
                            groupValue: _selectedGender,
                            onChanged: (String? value) {
                              setState(() {
                                _selectedGender = value;
                              });
                            },
                          ),
                          Text("หญิง"),
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
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => _selectDate(context),
                        child: Text(
                          _selectedDate == null
                              ? 'เลือกวัน/เดือน/ปี'
                              : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                        ),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          minimumSize:
                              Size(double.infinity, 50), // ปรับให้เต็มความกว้าง
                          elevation: 2,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  "ที่อยู่",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 10),
                _buildTextField(_addressController, "ที่อยู่"),
                SizedBox(height: 20),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: _buildTextField(_cityController, "เมือง"),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: _buildTextField(_districtController, "อำเภอ"),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: _buildTextField(_subDistrictController, "ตำบล"),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Center(
                  child: SizedBox(
                    width: double.infinity, // ทำให้ปุ่มกดเต็มความกว้าง
                    child: ElevatedButton(
                      onPressed: () {
                        // Handle the form submission logic here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 184, 66, 231),
                        elevation: 0,
                        minimumSize: Size(double.infinity, 50), // ขนาดของปุ่ม
                      ),
                      child: Text(
                        "เพิ่มข้อมูล",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20), // เพิ่มระยะห่างก่อนปุ่มย้อนกลับ
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return AdminWindow();
                          },
                        ),
                      ); // ย้อนกลับไปหน้าก่อนหน้า
                    },
                    child: const Text('ย้อนกลับ'),
                    style: TextButton.styleFrom(
                      foregroundColor:
                          Colors.blue, // เปลี่ยนสีข้อความปุ่มเป็นสีน้ำเงิน
                    ),
                  ),
                ),
              ],
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
        boxShadow: [
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
          hintStyle: TextStyle(color: Colors.grey),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(
              horizontal: 10, vertical: 15), // เพิ่ม padding
        ),
      ),
    );
  }
}
