import 'package:online_exam_c1_online/domain/app_user.dart';

// Base class for all states
sealed class VerificationScreenState {}

// States for the Forgot password screen
class InitialState extends VerificationScreenState {}

class LoadingState extends VerificationScreenState {}

class ErrorState extends VerificationScreenState {
  Exception? exception;

  ErrorState(this.exception);
}

class SuccessState extends VerificationScreenState {
  AppUser? appUser;

  SuccessState(this.appUser);
}
