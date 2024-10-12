import 'package:online_exam_c1_online/domain/app_user.dart';

sealed class SignupScreenState {}

class InitialState extends SignupScreenState {}

class LoadingState extends SignupScreenState {}

class ErrorState extends SignupScreenState {
  Exception? exception;
  ErrorState(this.exception);
}

class SuccessState extends SignupScreenState {
  AppUser? appUser;
  SuccessState(this.appUser);
}
