import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_c1_online/domain/app_user.dart';
import 'package:online_exam_c1_online/domain/model/User.dart';
import 'package:online_exam_c1_online/domain/usecase/auth_use_case.dart';

import '../../data/base/result.dart';

@injectable
class SignupViewModel extends Cubit<SignupScreenState> {
  AuthUseCase authUseCase;

  // Start state
  SignupViewModel(this.authUseCase) : super(InitialState());

  void doIntent(SignupScreenIntent intent) {
    switch (intent) {
      case SignupIntent():
        _signup(intent);
    }
  }

  void _signup(SignupIntent intent) async {
    emit(LoadingState());

    var result = await authUseCase.invoke(
      intent.userName,
      intent.firstName,
      intent.lastName,
      intent.email,
      intent.password,
      intent.rePassword,
      intent.phone,
    );

    switch (result) {
      case Success<User?>():
        emit(SuccessState(result.data));

      case Fail<User?>():
        emit(ErrorState(result.exception));
      case Success<AppUser?>():
      case Fail<AppUser?>():
      case Loading<AppUser?>():
    }
  }
}

sealed class SignupScreenIntent {}

class SignupIntent extends SignupScreenIntent {
  String userName;
  String firstName;
  String lastName;
  String email;
  String password;
  String rePassword;
  String phone;

  SignupIntent(
    this.userName,
    this.firstName,
    this.lastName,
    this.email,
    this.password,
    this.rePassword,
    this.phone,
  );
}

sealed class SignupScreenState {}

class InitialState extends SignupScreenState {}

class LoadingState extends SignupScreenState {}

class ErrorState extends SignupScreenState {
  Exception? exception;
  ErrorState(this.exception);
}

class SuccessState extends SignupScreenState {
  User? user;
  SuccessState(this.user);
}
