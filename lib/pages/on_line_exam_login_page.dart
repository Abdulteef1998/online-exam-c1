import 'package:flutter/material.dart';
import 'package:online_exam_c1_online/constants.dart';
import 'package:online_exam_c1_online/pages/on_line_exam_forgot_passoword_page.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'on_line_exam_sign_up_page.dart';

class OnLineExamLoginPage extends StatefulWidget {
  static String id = 'login page';

  @override
  _OnLineExamLoginPageState createState() => _OnLineExamLoginPageState();
}

class _OnLineExamLoginPageState extends State<OnLineExamLoginPage> {
  bool isLoading = false;
  final GlobalKey<FormState> formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isRememberMe = false;
  bool _isEmailValid = true;
  bool _isButtonEnabled = false;
  String? email, password;

  void _validateForm() {
    final isEmailValid = _emailController.text.isNotEmpty &&
        RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(_emailController.text);
    final isPasswordValid = _passwordController.text.isNotEmpty;

    setState(() {
      _isEmailValid = isEmailValid;
      _isButtonEnabled = isEmailValid && isPasswordValid;
    });
  }

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_validateForm);
    _passwordController.addListener(_validateForm);
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios, color: Colors.black),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Email Field
              OnLineExamCustomFormTextField(
                controller: _emailController,
                hintText: 'Email',
                errorText: _isEmailValid ? null : 'This email is not valid',
                onChanged: (data) {
                  email = data;
                },
              ),
              const SizedBox(height: 10),

              // Password Field
              OnLineExamCustomFormTextField(
                controller: _passwordController,
                obscureText: true,
                hintText: 'Password',
                onChanged: (data) {
                  password = data;
                },
              ),
              const SizedBox(height: 20),

              // Remember Me and Forgot Password
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
                  Text('Remember me', style: TextStyle(color: Colors.black)),
                  Spacer(),
                  // GestureDetector(
                  //   onTap: () {
                  //     // Handle forgot password tap
                  //   },
                  //   child: Text(
                  //     'Forgot password?',
                  //     style: TextStyle(
                  //       decoration: TextDecoration.underline,
                  //       color: Colors.black,
                  //     ),
                  //   ),
                  // ),

                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                          context, OnLineExamForgotPasswordPage.id);
                    },
                    child: Text(
                      ' Forgot password?',
                      style: TextStyle(
                        color: kprimaryColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Login Button
              CustomButton(
                onTap: () {},
                backgroundColor: kprimaryColor,
                text: "LogIn",
              ),

              const SizedBox(height: 10),

              // Sign up link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Don\'t have an account?',
                    style: TextStyle(color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, OnLineExamSignUpPage.id);
                    },
                    child: Text(
                      ' Sign up ',
                      style: TextStyle(
                        color: kprimaryColor,
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
