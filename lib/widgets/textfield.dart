import 'package:edu_ecommerce_demo/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class EduTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  bool obscureText;
  dynamic validator;

  EduTextField(
      {super.key, required this.hintText, required this.controller, this.obscureText = false, this.validator});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: brand_color,
          border: Border.all(color: text_light_color)),
      child: TextFormField(
        validator: validator,
        obscureText: obscureText,
        controller: controller,
        style: TextStyle(color: text_light_color),
        decoration: InputDecoration(
            hintStyle: TextStyle(color: text_light_color),
            border: InputBorder.none,
            hintText: hintText,
            contentPadding: const EdgeInsets.symmetric(horizontal: 20)),
      ),
    );
  }
}
