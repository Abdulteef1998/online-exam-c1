import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_c1_online/core/helper/form_validation.dart';
import 'package:online_exam_c1_online/core/utils/colors.dart';
import 'package:online_exam_c1_online/core/utils/styles.dart';
import 'package:online_exam_c1_online/view/forgot_password_screen/forgot_password_screen.dart';
import 'package:online_exam_c1_online/view/signUp_screen/signUp_screen.dart';
import 'package:online_exam_c1_online/widgets/custom_button.dart';
import 'package:online_exam_c1_online/widgets/custom_text_field.dart';

class SignInScreen extends StatefulWidget {
  static String id = 'login page';

  const SignInScreen({super.key});

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool isLoading = false;
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isRememberMe = false;
  bool _isEmailValid = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              10.verticalSpace,
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
                    onPressed: () {},
                  ),
                  Text('Login',
                      style: Styles.textStyle24.copyWith(color: Colors.black)),
                ],
              ),
              20.verticalSpace,
              CustomTextFieldForm(
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
              10.verticalSpace,
              CustomTextFieldForm(
                controller: _passwordController,
                obscureText: true,
                hintText: 'Password',
                onValidate: (val) => FormValidation().isValidPassword(val!),
              ),
              10.verticalSpace,
              Row(
                children: [
                  Checkbox(
                    value: _isRememberMe,
                    onChanged: (value) {
                      setState(() {
                        _isRememberMe = value!;
                      });
                    },
                  ),
                  Text('Remember me',
                      style: Styles.textStyle16.copyWith(color: Colors.black)),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, ForgotPasswordScreen.id);
                    },
                    child: Text(' Forget password?',
                        style: Styles.textStyle16.copyWith(
                            color: Colors.black,
                            decoration: TextDecoration.underline)),
                  ),
                ],
              ),
              15.verticalSpace,
              CustomButton(
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    print('object');
                  }
                },
                backgroundColor: _isEmailValid == true
                    ? const Color(0xff878787)
                    : kprimaryColor,
                text: "LogIn",
              ),
              13.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account?',
                    style: Styles.textStyle16,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, SignUpScreen.id);
                    },
                    child: Text(
                      ' Sign up ',
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
        ),
      ),
    );
  }

  void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
