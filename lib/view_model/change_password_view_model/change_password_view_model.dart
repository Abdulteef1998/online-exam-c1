// ViewModel for Forgot password
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_c1_online/data/base/result.dart';
import 'package:online_exam_c1_online/domain/usecase/auth_use_case.dart';

import '../../domain/app_user.dart';
import 'change_password_contract.dart';

@injectable
class RestPasswordViewModel extends Cubit<RestPasswordScreenState> {
  final AuthUseCase authUseCase;

  RestPasswordViewModel(this.authUseCase) : super(InitialState());

  void restpassword(
    String email,
    String newPassword,
  ) async {
    emit(LoadingState());
    var result = await authUseCase.invokeresetpassword(
      email,
      newPassword,
    );
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
