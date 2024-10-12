import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_c1_online/domain/app_user.dart';
import 'package:online_exam_c1_online/domain/model/User.dart';

import '../../data/base/result.dart';
import '../../domain/usecase/auth_use_case.dart';

@injectable
class LoginViewModel extends Cubit<LoginScreenState> {
  AuthUseCase authUseCase;
  LoginViewModel(this.authUseCase) : super(InitialState());

  void doIntent(LoginScreenIntent intent) {
    switch (intent) {
      case LoginIntent():
        _login(intent);
    }
  }

  void _login(LoginIntent intent) async {
    emit(LoadingState());

    var result = await authUseCase.invoke(intent.email, intent.password);
    switch (result) {
      case Success<User?>():
        {
          emit(SuccessState(result.data));
        }
      case Fail<User?>():
        {
          emit(ErrorState(result.exception));
        }
      case Success<AppUser?>():
      case Fail<AppUser?>():
      case Loading<AppUser?>():
    }
  }
}

sealed class LoginScreenIntent {}

class LoginIntent extends LoginScreenIntent {
  String email;
  String password;
  LoginIntent(this.email, this.password);
}

sealed class LoginScreenState {}

class InitialState extends LoginScreenState {}

class LoadingState extends LoginScreenState {}

class ErrorState extends LoginScreenState {
  Exception? exception;
  ErrorState(this.exception);
}

class SuccessState extends LoginScreenState {
  User? user;
  SuccessState(this.user);
}
