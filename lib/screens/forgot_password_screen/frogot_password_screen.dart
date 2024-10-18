import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_c1_online/config/di.dart';
import 'package:online_exam_c1_online/core/helper/form_validation.dart';
import 'package:online_exam_c1_online/core/helper/snack_bar.dart';
import 'package:online_exam_c1_online/core/utils/colors.dart';
import 'package:online_exam_c1_online/core/utils/styles.dart';
import 'package:online_exam_c1_online/data/base/exceptions.dart';
import 'package:online_exam_c1_online/screens/forgot_password_screen/verification_code_screen.dart';
import 'package:online_exam_c1_online/view_model/forgot_password_view_model/forgot_password_contract.dart';
import 'package:online_exam_c1_online/view_model/forgot_password_view_model/forgot_password_view_model.dart';
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
  bool isLoading = false;
  bool isSuccess = false;

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

  ForgotViewModel viewModel = getIt.get<ForgotViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ForgotViewModel>(
      create: (BuildContext context) => viewModel,
      child: Scaffold(
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
                        icon: const Icon(Icons.arrow_back_ios,
                            color: Colors.black),
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
                  BlocConsumer<ForgotViewModel, ForGotScreenState>(
                    listenWhen: (previous, current) {
                      return current is! InitialState;
                    },
                    listener: (context, state) {
                      switch (state) {
                        case ErrorState():
                          var exception = state.exception;
                          String? message = "something went wrong";
                          if (exception is NoInternetException) {
                            message = "Please check internet connection";
                          } else if (exception is ServerError) {
                            message = exception.serverMessage;
                          }
                          return ShowSnackBar.show(
                            context: context,
                            message: message ?? "",
                            isSuccess: false,
                          );
                        case SuccessState():
                          Navigator.pushNamed(
                            context,
                            VerificationCodeScreen.id,
                          );
                        default: {}
                      }
                    },
                    builder: (context, state) {
                      isLoading = state is LoadingState;
                      return Column(
                        children: [
                          Form(
                            key: formKey,
                            child: CustomTextFieldForm(
                              controller: _emailController,
                              hintText: 'Email',
                              onValidate: (val) {
                                if (val!.isEmpty) {
                                  return 'email is required';
                                }
                                if (FormValidation.isNotValidEmail(val)) {
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
                          isLoading
                              ? const CircularProgressIndicator.adaptive()
                              : CustomButton(
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      viewModel.forgotPassword(
                                          _emailController.text);
                                    }
                                  },
                                  backgroundColor: _isEmailValid == true
                                      ? const Color(0xff878787)
                                      : kprimaryColor,
                                  text: "Continue",
                                ),
                        ],
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
