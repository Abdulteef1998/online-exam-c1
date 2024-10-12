import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_c1_online/data/base/result.dart';
import 'package:online_exam_c1_online/domain/app_user.dart';
import 'package:online_exam_c1_online/domain/usecase/auth_use_case.dart';
import 'package:online_exam_c1_online/view_model/signUp_view_model/signUp_contract.dart';

@injectable
class SignupViewModel extends Cubit<SignupScreenState> {
  AuthUseCase authUseCase;

  SignupViewModel(this.authUseCase) : super(InitialState());

  void register(String userName, String firstName, String lastName,
      String email, String password, String rePassword, String phone) async {
    emit(LoadingState());

    var result = await authUseCase.invokeRegister(
        userName, firstName, lastName, email, password, rePassword, phone);
    switch (result) {
      case Success<AppUser?>():
        emit(SuccessState(result.data));
      case Fail<AppUser?>():
        emit(ErrorState(result.exception));
      case Loading<AppUser?>():
    }
  }
}
