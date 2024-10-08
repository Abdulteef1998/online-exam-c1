import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.onTap,
    required this.text,
    this.backgroundColor = Colors.blue, // اللون الافتراضي للأزرار
    this.borderRadius = 30.0, // لتحديد درجة استدارة الزوايا
  });

  final VoidCallback? onTap;
  final String text;
  final Color backgroundColor;
  final double borderRadius; // التحكم في استدارة الزوايا

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius:
              BorderRadius.circular(borderRadius), // تغيير استدارة الزوايا
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
