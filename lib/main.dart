import 'package:flutter/material.dart';

import 'pages/login_page.dart';
import 'pages/registeer_page.dart';

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
        OnLineExamRegisterPage.id: (context) => OnLineExamRegisterPage(),
      },
      initialRoute: OnLineExamLoginPage.id,
    );
  }
}
