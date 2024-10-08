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
  String? userName;
  String? firstName;
  String? lastName;
  String? email;
  String? password;
  String? confirmPassword;
  String? phoneNumber;
  bool isLoading = false;
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
                      icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
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
                    if(val!.isEmpty){
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
                        onChanged: (data) {
                          firstName = data;
                        },
                      ),
                    ),
                    const SizedBox(width: 15), // Space between fields
                    Expanded(
                      child: CustomTextFieldForm(
                        hintText: 'Last Name',
                        onChanged: (data) {
                          lastName = data;
                        },
                      ),
                    ),
                  ],
                ),
                8.verticalSpace,
                CustomTextFieldForm(
                  hintText: 'Email',
                  onChanged: (data) {
                    email = data;
                  },
                ),
                8.verticalSpace,
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFieldForm(
                        hintText: 'Password',
                        obscureText: true,
                        onChanged: (data) {
                          password = data;
                        },
                      ),
                    ),
                    const SizedBox(width: 15), // Space between fields
                    Expanded(
                      child: CustomTextFieldForm(
                        hintText: 'Confirm Password',
                        obscureText: true,
                        onChanged: (data) {
                          confirmPassword = data;
                        },
                      ),
                    ),
                  ],
                ),
                8.verticalSpace,
                CustomTextFieldForm(
                  hintText: 'Phone Number',
                  onChanged: (data) {
                    phoneNumber = data;
                  },
                ),
                15.verticalSpace,
                CustomButton(
                  onTap: () {
                    if(formKey.currentState!.validate()){
                      print('');
                    }
                  },
                  backgroundColor: kprimaryColor,
                  text: "Signup",
                ),
                13.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account? ',
                      style: TextStyle(color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, SignInScreen.id);
                      },
                      child: const Text(
                        ' Login',
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
      ),
    );
  }

  // Display a snackbar with a message
  void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
