import 'package:go_router/go_router.dart';
import 'package:online_exam_c1_online/view/forgot_password_screen/forgot_password_screen.dart';
import 'package:online_exam_c1_online/view/signIn_screen/signIn_screen.dart';
import 'package:online_exam_c1_online/view/signUp_screen/signUp_screen.dart';


abstract class AppRoute {
  static const signUpScreen = '/signUpScreen';
  static const forgotPasswordScreen = '/forgotPasswordScreen';


  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SignInScreen(),
      ),
      GoRoute(
        path: signUpScreen,
        builder: (context, state) => const SignUpScreen(),
      ),
      GoRoute(
        path: forgotPasswordScreen,
        builder: (context, state) => const ForgotPasswordScreen(),
      ),
    ],
  );
}
