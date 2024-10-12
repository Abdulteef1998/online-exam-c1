// ViewModel for Forgot password
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_c1_online/data/base/result.dart';
import 'package:online_exam_c1_online/domain/usecase/auth_use_case.dart';

import '../../domain/app_user.dart';
import 'forgot_password_contract.dart';

@injectable
class ForgotViewModel extends Cubit<ForGotScreenState> {
  final AuthUseCase authUseCase;

  ForgotViewModel(this.authUseCase) : super(InitialState());

  void forgotPassword(String email) async {
    emit(LoadingState());
    var result = await authUseCase.invokeForgotpassword(email);
    switch (result) {
      case Success<AppUser?>():
        emit(SuccessState(result.data));

      case Fail<AppUser?>():
        emit(ErrorState(result.exception));
        break;
      case Loading<AppUser?>():
    }
  }
}
