import 'package:online_exam_c1_online/domain/app_user.dart';

sealed class LoginScreenState {}

class InitialState extends LoginScreenState {}

class LoadingState extends LoginScreenState {}

class ErrorState extends LoginScreenState {
  Exception? exception;

  ErrorState(this.exception);
}

class SuccessState extends LoginScreenState {
  AppUser? appUser;
  SuccessState(this.appUser);
}
