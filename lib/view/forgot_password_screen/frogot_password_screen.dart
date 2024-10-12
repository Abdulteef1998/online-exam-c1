import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_c1_online/core/helper/form_validation.dart';
import 'package:online_exam_c1_online/core/utils/colors.dart';
import 'package:online_exam_c1_online/core/utils/styles.dart';
import 'package:online_exam_c1_online/view/forgot_password_screen/verification_code_screen.dart';
import 'package:online_exam_c1_online/widgets/custom_button.dart';
import 'package:online_exam_c1_online/widgets/custom_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  static String id = 'Forgot page';
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  late final TextEditingController _emailController;
  bool _isEmailValid = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
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
                  'Forget password',
                  style: Styles.textStyle18,
                ),
                10.verticalSpace,
                const Text(
                  'Please enter your email associated to \n your account',
                  style: Styles.textStyle14,
                  textAlign: TextAlign.center,
                ),
                20.verticalSpace,
                Form(
                  key: formKey,
                  child: CustomTextFieldForm(
                    controller: _emailController,
                    hintText: 'Email',
                    onValidate: (val) {
                      if (FormValidation.isNotValidEmail(val!)) {
                        setState(() {
                          _isEmailValid = true;
                        });
                        return 'This email is not valid';
                      }
                      return null;
                    },
                  ),
                ),
                20.verticalSpace,
                CustomButton(
                  onTap: () {
                    // if (formKey.currentState!.validate()) {
                      /// after send emil to api to get code
                      /// direct the page to verification code screen
                      Navigator.pushNamed(
                          context, VerificationCodeScreen.id);
                    // }
                  },
                  backgroundColor: _isEmailValid == true
                      ? const Color(0xff878787)
                      : kprimaryColor,
                  text: "Continue",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
