import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:online_exam_c1_online/config/di.dart';
import 'package:online_exam_c1_online/core/utils/constants.dart';
import 'package:online_exam_c1_online/view/forgot_password_screen/frogot_password_screen.dart';
import 'package:online_exam_c1_online/view/forgot_password_screen/verification_code_screen.dart';
import 'package:online_exam_c1_online/view/signIn_screen/signIn_screen.dart';
import 'package:online_exam_c1_online/view/signUp_screen/signUp_screen.dart';

import 'view/forgot_password_screen/change_password_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(const OnLineExam());
}

class OnLineExam extends StatelessWidget {
  const OnLineExam({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppConstants.APP_NAME,
          routes: {
            SignInScreen.id: (context) => const SignInScreen(),
            SignUpScreen.id: (context) => const SignUpScreen(),
            ForgotPasswordScreen.id: (context) => const ForgotPasswordScreen(),
            VerificationCodeScreen.id: (context) => const VerificationCodeScreen(),
            ChangePasswordScreen.id: (context) => const ChangePasswordScreen(),
          },
          initialRoute: SignInScreen.id,
        );
      },
    );
  }
}
