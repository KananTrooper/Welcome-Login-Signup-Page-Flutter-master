import 'package:flutter/material.dart';

class Userdata {
  final String name;
  final String phone;
  final String imageUrl;
  final bool isAuthorized;

  Userdata({
    required this.name,
    required this.phone,
    required this.imageUrl,
    required this.isAuthorized,
  });
}
