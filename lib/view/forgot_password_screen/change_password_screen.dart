import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_c1_online/core/utils/colors.dart';
import 'package:online_exam_c1_online/core/utils/styles.dart';
import 'package:online_exam_c1_online/widgets/custom_button.dart';
import 'package:online_exam_c1_online/widgets/custom_text_field.dart';

class ChangePasswordScreen extends StatefulWidget {
  static String id = 'change password screen';
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                      icon:
                          const Icon(Icons.arrow_back_ios, color: Colors.black),
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
                  'Reset password',
                  style: Styles.textStyle18,
                ),
                10.verticalSpace,
                const Text(
                  'Password must not be empty and must contain \n 6 characters with upper case letter and one \n number at least ',
                  style: Styles.textStyle14,
                  textAlign: TextAlign.center,
                ),
                20.verticalSpace,
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextFieldForm(
                        controller: _passwordController,
                        hintText: 'password',
                        onValidate: (val) {
                          if (val!.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                      ),
                      10.verticalSpace,
                      CustomTextFieldForm(
                        controller: _confirmPasswordController,
                        hintText: 'Confirm password',
                        onValidate: (val) {
                          if (val!.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                30.verticalSpace,
                CustomButton(
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      /// call change password method here
                    }
                  },
                  backgroundColor: kprimaryColor,
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
