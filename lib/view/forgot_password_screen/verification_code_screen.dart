import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_c1_online/core/utils/colors.dart';
import 'package:online_exam_c1_online/core/utils/styles.dart';
import 'package:online_exam_c1_online/view/forgot_password_screen/change_password_screen.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerificationCodeScreen extends StatefulWidget {
  static String id = 'Verification Screen';
  const VerificationCodeScreen({super.key});

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  late final TextEditingController _otpController;
  @override
  void initState() {
    super.initState();
    _otpController = TextEditingController();
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            Column(
              children: [
                20.verticalSpace,
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Text(
                      'Password',
                      style: Styles.textStyle20,
                    ),
                  ],
                ),
                20.verticalSpace,
                const Text(
                  'Email verification',
                  style: Styles.textStyle18,
                ),
                10.verticalSpace,
                const Text(
                  'Please enter your code that send to your \n email address',
                  style: Styles.textStyle14,
                  textAlign: TextAlign.center,
                ),
                20.verticalSpace,
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                    child: PinCodeTextField(
                      length: 4,
                      appContext: context,
                      obscureText: false,
                      showCursor: true,
                      keyboardType: TextInputType.number,
                      animationType: AnimationType.fade,
                      controller: _otpController,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        fieldHeight: 68,
                        fieldWidth: 74,
                        borderWidth: 1,
                        borderRadius: BorderRadius.circular(10),
                        selectedColor: const Color(0xffDFE7F7),
                        selectedFillColor: Colors.white,
                        inactiveFillColor: const Color(0xffDFE7F7),
                        inactiveColor: const Color(0xffDFE7F7),
                        activeColor: const Color(0xffDFE7F7),
                        activeFillColor: const Color(0xffDFE7F7),
                      ),
                      animationDuration: const Duration(milliseconds: 300),
                      backgroundColor: Colors.transparent,
                      enableActiveFill: true,
                      onChanged: (value) {
                        /// call the api method here
                      },
                      beforeTextPaste: (text) {
                        return true;
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t receive code?',
                      style: Styles.textStyle16,
                    ),
                    2.horizontalSpace,
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, ChangePasswordScreen.id);
                      },
                      child: Text(
                        'Resend?',
                        style: Styles.textStyle16.copyWith(
                          color: kprimaryColor,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
