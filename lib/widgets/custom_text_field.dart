import 'package:flutter/material.dart';

class CustomTextFieldForm extends StatelessWidget {
  final Function(String)? onChanged;
  final String? Function(String?)? onValidate;
  final bool obscureText;
  final String? hintText;
  final String? errorText;
  final TextEditingController? controller;

  const CustomTextFieldForm({
    super.key,
    this.hintText,
    this.onChanged,
    this.obscureText = false,
    this.errorText,
    this.controller,
    this.onValidate,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
      validator: onValidate,
      decoration: InputDecoration(
        labelText: hintText,
        labelStyle: const TextStyle(color: Colors.grey),
        errorText: errorText,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
            width: 2.0,
          ),
        ),
        errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 1.5,
          ),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 2.0,
          ),
        ),
      ),
      style: const TextStyle(
        color: Colors.black,
      ),
    );
  }
}
