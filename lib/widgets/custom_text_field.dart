import 'package:flutter/material.dart';

class CustomTextFieldForm extends StatefulWidget {
  final Function(String)? onChanged;
  final String? Function(String?)? onValidate;
  final String? hintText;
  final String? errorText;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final bool isPassword;

  const CustomTextFieldForm({
    super.key,
    this.hintText,
    this.onChanged,
    this.isPassword = false,
    this.errorText,
    this.controller,
    this.onValidate,
    this.textInputAction,
  });

  @override
  State<CustomTextFieldForm> createState() => _CustomTextFieldFormState();
}

class _CustomTextFieldFormState extends State<CustomTextFieldForm> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.isPassword ? _obscureText : false,
      onChanged: widget.onChanged,
      validator: widget.onValidate,
      textInputAction: widget.textInputAction,
      decoration: InputDecoration(
        labelText: widget.hintText,
        labelStyle: const TextStyle(color: Colors.grey),
        errorText: widget.errorText,
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
        suffixIcon: widget.isPassword
            ? IconButton(
            icon: Icon(
                _obscureText ? Icons.visibility_off : Icons.visibility,
                color: Theme.of(context).hintColor.withOpacity(0.3)),
            onPressed: _toggle)
            : null,
      ),
      style: const TextStyle(
        color: Colors.black,
      ),
    );
  }
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
