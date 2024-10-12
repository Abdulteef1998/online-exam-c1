import 'package:online_exam_c1_online/domain/app_user.dart';

// Base class for all states
sealed class ForGotScreenState {}

// States for the Forgot password screen
class InitialState extends ForGotScreenState {}

class LoadingState extends ForGotScreenState {}

class ErrorState extends ForGotScreenState {
  Exception? exception;

  ErrorState(this.exception);
}

class SuccessState extends ForGotScreenState {
  AppUser? appUser;

  SuccessState(this.appUser);
}
