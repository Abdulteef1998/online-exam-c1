// ViewModel for Forgot password
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_c1_online/data/base/result.dart';
import 'package:online_exam_c1_online/domain/usecase/auth_use_case.dart';

import '../../domain/app_user.dart';
import 'verification_password_contract.dart';

@injectable
class VerificationViewModel extends Cubit<VerificationScreenState> {
  final AuthUseCase authUseCase;

  VerificationViewModel(this.authUseCase) : super(InitialState());

  void verifyresetcode(
    String resetCode,
  ) async {
    emit(LoadingState());
    var result = await authUseCase.invokeverifyresetcode(resetCode);
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
