import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_c1_online/config/di.dart';
import 'package:online_exam_c1_online/core/helper/snack_bar.dart';
import 'package:online_exam_c1_online/core/utils/colors.dart';
import 'package:online_exam_c1_online/core/utils/styles.dart';
import 'package:online_exam_c1_online/data/base/exceptions.dart';
import 'package:online_exam_c1_online/screens/signIn_screen/signIn_screen.dart';
import 'package:online_exam_c1_online/view_model/signUp_view_model/signUp_contract.dart';
import 'package:online_exam_c1_online/view_model/signUp_view_model/signup_view_model.dart';
import 'package:online_exam_c1_online/widgets/custom_button.dart';
import 'package:online_exam_c1_online/widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  static String id = 'signup Page';

  const SignUpScreen({super.key});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController _userNameController;

  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _confirmPasswordController;

  late final TextEditingController _firstNameController;
  late final TextEditingController _lastNameController;
  late final TextEditingController _phoneNumberController;

  bool isLoading = false;
  bool _isEmailValid = false;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _userNameController = TextEditingController();
    _emailController = TextEditingController();
    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    _phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _userNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  SignupViewModel viewModel = getIt.get<SignupViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SignupViewModel>(
      create: (BuildContext context) => viewModel,
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
                BlocConsumer<SignupViewModel, SignupScreenState>(
                  listenWhen: (previous, current) {
                    return current is! InitialState;
                  },
                  listener: (context, state) {
                    switch (state) {
                      case ErrorState():
                        {
                          var exception = state.exception;
                          String? message = "something went wrong";
                          if (exception is NoInternetException) {
                            message = "Please check internet connection";
                          } else if (exception is ServerError) {
                            message = exception.serverMessage;
                          } else if (exception is ParsingError) {
                            message = exception.parsingErrorMessage;
                          }
                          return ShowSnackBar.show(
                            context: context,
                            message: message ?? "",
                            isSuccess: false,
                          );
                        }
                      case SuccessState():
                        {
                          return ShowSnackBar.show(
                            context: context,
                            message: 'sign up successfully',
                            isSuccess: true,
                          );
                        }
                      default:
                        {}
                    }
                  },
                  builder: (context, state) {
                    isLoading = state is LoadingState;
                    return Column(
                      children: [
                        20.verticalSpace,
                        CustomTextFieldForm(
                          hintText: 'Enter your user name',
                          controller: _userNameController,
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
                                    return 'Enter your Last Name';
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
                                isPassword: true,
                                controller: _passwordController,
                                onValidate: (val) {
                                  if (val!.isEmpty) {
                                    return 'Enter your Password';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(width: 15), // Space between fields
                            Expanded(
                              child: CustomTextFieldForm(
                                isPassword: true,
                                hintText: 'Confirm Password',
                                controller: _confirmPasswordController,
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
                              return 'Enter your Phone Number';
                            }
                            return null;
                          },
                        ),
                        15.verticalSpace,
                        isLoading
                            ? const CircularProgressIndicator.adaptive()
                            : CustomButton(
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    viewModel.register(
                                      _userNameController.text,
                                      _firstNameController.text,
                                      _lastNameController.text,
                                      _emailController.text,
                                      _passwordController.text,
                                      _confirmPasswordController.text,
                                      _phoneNumberController.text,
                                    );
                                  }
                                },
                                backgroundColor: _isEmailValid == true
                                    ? const Color(0xff878787)
                                    : kprimaryColor,
                                text: "Signup",
                              ),
                      ],
                    );
                  },
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

  // Display a snack-bar with a message
  void showSnackBar(BuildContext context, String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
