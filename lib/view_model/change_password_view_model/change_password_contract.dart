import 'package:online_exam_c1_online/domain/app_user.dart';

// Base class for all states
sealed class RestPasswordScreenState {}

// States for the Forgot password screen
class InitialState extends RestPasswordScreenState {}

class LoadingState extends RestPasswordScreenState {}

class ErrorState extends RestPasswordScreenState {
  Exception? exception;

  ErrorState(this.exception);
}

class SuccessState extends RestPasswordScreenState {
  AppUser? appUser;

  SuccessState(this.appUser);
}
