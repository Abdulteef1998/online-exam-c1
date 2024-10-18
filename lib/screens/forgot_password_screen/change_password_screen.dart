import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_c1_online/config/di.dart';
import 'package:online_exam_c1_online/core/helper/snack_bar.dart';
import 'package:online_exam_c1_online/core/utils/colors.dart';
import 'package:online_exam_c1_online/core/utils/styles.dart';
import 'package:online_exam_c1_online/data/base/exceptions.dart';
import 'package:online_exam_c1_online/view_model/forgot_password_view_model/forgot_password_contract.dart';
import 'package:online_exam_c1_online/view_model/forgot_password_view_model/forgot_password_view_model.dart';
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
  late final TextEditingController _emailController;
  late final TextEditingController _confirmPasswordController;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  final ForgotViewModel viewModel = getIt.get<ForgotViewModel>();

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
                          return ShowSnackBar.show(
                            context: context,
                            message: "change password successfully",
                            isSuccess: true,
                          );
                        default:
                          {}
                      }
                    },
                    builder: (context, state) {
                      isLoading = state is LoadingState;
                      return Column(
                        children: [
                          Form(
                            key: formKey,
                            child: Column(
                              children: [
                                CustomTextFieldForm(
                                  controller: _emailController,
                                  hintText: 'email',
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
                                  isPassword: true,
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
                          isLoading
                              ? const CircularProgressIndicator.adaptive()
                              : CustomButton(
                                  onTap: () {
                                    if (formKey.currentState!.validate()) {
                                      viewModel.restPassword(
                                        _emailController.text,
                                        _confirmPasswordController.text,
                                      );
                                    }
                                  },
                                  backgroundColor: kprimaryColor,
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
