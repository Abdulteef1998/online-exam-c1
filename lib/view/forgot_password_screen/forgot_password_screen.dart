import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_c1_online/core/utils/styles.dart';

class ForgotPasswordScreen extends StatelessWidget {
  static String id = 'Forgot page';
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            10.verticalSpace,
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                const Text(
                  'Login',
                  style: Styles.textStyle20,
                ),
              ],
            ),
            10.verticalSpace,
          ],
        ),
      ),
    );
  }
}
