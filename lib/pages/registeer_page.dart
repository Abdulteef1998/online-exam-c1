import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:online_exam_c1_online/constants.dart';

import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';
import 'login_page.dart';

class OnLineExamRegisterPage extends StatefulWidget {
  static String id = 'signup Page';

  @override
  _OnLineExamRegisterPageState createState() => _OnLineExamRegisterPageState();
}

class _OnLineExamRegisterPageState extends State<OnLineExamRegisterPage> {
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
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
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
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                // Row(
                //   children: const [
                //     Text(
                //       ' Sign up',
                //       style: TextStyle(
                //         fontSize: 24,
                //         color: Colors.white,
                //       ),
                //     ),
                //   ],
                // ),
                const SizedBox(height: 20),

                // User Name Field
                OnLineExamCustomFormTextField(
                  hintText: 'Enter your user name',
                  onChanged: (data) {
                    userName = data;
                  },
                ),
                const SizedBox(height: 15),

                // First Name and Last Name Fields in a Row
                Row(
                  children: [
                    Expanded(
                      child: OnLineExamCustomFormTextField(
                        hintText: 'Enter First Name',
                        onChanged: (data) {
                          firstName = data;
                        },
                      ),
                    ),
                    const SizedBox(width: 15), // Space between fields
                    Expanded(
                      child: OnLineExamCustomFormTextField(
                        hintText: 'Last Name',
                        onChanged: (data) {
                          lastName = data;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                // Email Field
                OnLineExamCustomFormTextField(
                  hintText: 'Email',
                  onChanged: (data) {
                    email = data;
                  },
                ),
                const SizedBox(height: 15),

                // Password and Confirm Password Fields in a Row
                Row(
                  children: [
                    Expanded(
                      child: OnLineExamCustomFormTextField(
                        hintText: 'Password',
                        obscureText: true,
                        onChanged: (data) {
                          password = data;
                        },
                      ),
                    ),
                    const SizedBox(width: 15), // Space between fields
                    Expanded(
                      child: OnLineExamCustomFormTextField(
                        hintText: 'Confirm Password',
                        obscureText: true,
                        onChanged: (data) {
                          confirmPassword = data;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),

                // Phone Number Field
                OnLineExamCustomFormTextField(
                  hintText: 'Phone Number',
                  onChanged: (data) {
                    phoneNumber = data;
                  },
                ),
                const SizedBox(height: 30),

                // Register Button
                CustomButton(
                  onTap: () {
                    // Handle registration logic here
                  },
                  backgroundColor: kprimaryColor,
                  text: "Signup",
                ),

                const SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(color: Colors.black),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, OnLineExamLoginPage.id);
                      },
                      child: Text(
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
