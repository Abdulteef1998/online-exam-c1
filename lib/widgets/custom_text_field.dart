import 'package:flutter/material.dart';

class OnLineExamCustomFormTextField extends StatelessWidget {
  final Function(String)? onChanged;
  final bool obscureText;
  final String? hintText;
  final String? errorText;
  final TextEditingController? controller;

  OnLineExamCustomFormTextField({
    this.hintText,
    this.onChanged,
    this.obscureText = false,
    this.errorText,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: hintText, // Inside border label text
        labelStyle: TextStyle(color: Colors.grey), // Label style color
        errorText: errorText, // Error message text
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey, // Border color when enabled
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue, // Border color when focused
            width: 2.0,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red, // Border color when there's an error
            width: 1.5,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red, // Border color when focused and has error
            width: 2.0,
          ),
        ),
      ),
      style: TextStyle(
        color: Colors.black, // Text color
      ),
    );
  }
}
