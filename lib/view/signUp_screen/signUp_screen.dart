import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:online_exam_c1_online/core/utils/colors.dart';
import 'package:online_exam_c1_online/core/utils/styles.dart';
import 'package:online_exam_c1_online/view/signIn_screen/signIn_screen.dart';
import 'package:online_exam_c1_online/widgets/custom_button.dart';
import 'package:online_exam_c1_online/widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  static String id = 'signup Page';

  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController userNameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  String? userName;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? confirmPassword;
  String? phoneNumber;
  bool isLoading = false;
  bool _isEmailValid = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
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
                      icon:
                          const Icon(Icons.arrow_back_ios, color: Colors.black),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    const Text(
                      'Sign Up',
                      style: Styles.textStyle20,
                    ),
                  ],
                ),
                20.verticalSpace,
                CustomTextFieldForm(
                  hintText: 'Enter your user name',
                  controller: userNameController,
                  onValidate: (val) {
                    if (val!.isEmpty) {
                      setState(() {
                        _isEmailValid = true;
                      });
                      return 'The user Name is not valid';
                    }
                    return null;
                  },
                ),
                8.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFieldForm(
                        hintText: 'Enter First Name',
                        controller: _firstNameController,
                        onValidate: (val) {
                          if (val!.isEmpty) {
                            return 'first name is required';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 15), // Space between fields
                    Expanded(
                      child: CustomTextFieldForm(
                        hintText: 'Last Name',
                        controller: _lastNameController,
                        onValidate: (val) {
                          if (val!.isEmpty) {
                            return '';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                8.verticalSpace,
                CustomTextFieldForm(
                  hintText: 'Email',
                  controller: _emailController,
                  onValidate: (val) {
                    if (val!.isEmpty) {
                      return 'This Email is not valid';
                    }
                    return null;
                  },
                ),
                8.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFieldForm(
                        hintText: 'Password',
                        controller: _passwordController,
                        onValidate: (val) {
                          if (val!.isEmpty) {
                            return '';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 15), // Space between fields
                    Expanded(
                      child: CustomTextFieldForm(
                        hintText: 'Confirm Password',
                        controller: _passwordController,
                        onValidate: (val) {
                          if (val!.isEmpty) {
                            return 'Password not matched';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                8.verticalSpace,
                CustomTextFieldForm(
                  hintText: 'Phone Number',
                  controller: _phoneNumberController,
                  onValidate: (val) {
                    if (val!.isEmpty) {
                      return '';
                    }
                    return null;
                  },
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
                  text: "Signup",
                ),
                13.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Already have an account? ',
                        style: Styles.textStyle16),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, SignInScreen.id);
                      },
                      child: Text(' Login',
                          style: Styles.textStyle16
                              .copyWith(color: kprimaryColor)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Display a snackbar with a message
  void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
