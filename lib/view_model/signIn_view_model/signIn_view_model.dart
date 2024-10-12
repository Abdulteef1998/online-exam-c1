import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam_c1_online/data/base/result.dart';
import 'package:online_exam_c1_online/domain/app_user.dart';
import 'package:online_exam_c1_online/domain/usecase/auth_use_case.dart';
import 'package:online_exam_c1_online/view_model/signIn_view_model/signIn_contract.dart';

@injectable
class LoginViewModel extends Cubit<LoginScreenState> {
  AuthUseCase authUseCase;

  LoginViewModel(this.authUseCase) : super(InitialState());

  void login(String email,String password) async {
    emit(LoadingState());
    var result = await authUseCase.invoke(email, password);
    switch (result) {
      case Success<AppUser?>():
        emit(SuccessState(result.data));
      case Fail<AppUser?>():
        emit(ErrorState(result.exception));
      case Loading<AppUser?>():
    }
  }
}
