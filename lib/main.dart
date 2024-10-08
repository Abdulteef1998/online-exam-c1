import 'package:flutter/material.dart';
import 'package:online_exam_c1_online/pages/on_line_exam_forgot_passoword_page.dart';

import 'pages/on_line_exam_login_page.dart';
import 'pages/on_line_exam_sign_up_page.dart';

// Multi-layered application for maintainability and testing
void main() {
  runApp(const OnLineExam());
}

class OnLineExam extends StatelessWidget {
  const OnLineExam({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        OnLineExamLoginPage.id: (context) => OnLineExamLoginPage(),
        OnLineExamSignUpPage.id: (context) => OnLineExamSignUpPage(),
        OnLineExamForgotPasswordPage.id: (context) =>
            OnLineExamForgotPasswordPage(),
      },
      initialRoute: OnLineExamLoginPage.id,
    );
  }
}
