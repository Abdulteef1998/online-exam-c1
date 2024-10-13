import 'package:injectable/injectable.dart';
import 'package:online_exam_c1_online/data/api_manager/api_manager.dart';
import 'package:online_exam_c1_online/data/base/api_extensions.dart';
import 'package:online_exam_c1_online/data/base/result.dart';
import 'package:online_exam_c1_online/dataSource/contracts/auth_data_source.dart';
import 'package:online_exam_c1_online/domain/app_user.dart';
import 'package:online_exam_c1_online/domain/model/register_model.dart';

@Injectable(as: AuthDataSource)
class AuthDatasourceImpl implements AuthDataSource {
  ApiManager apiManager;
  AuthDatasourceImpl(this.apiManager);

  @override
  Future<Result<AppUser?>> login(String email, String password) async {
    return executeApi<AppUser?>(
      () async {
        var result = await apiManager.login(email, password);
        return Success(result.user?.toAppUser());
      },
    );
  }

  @override
  Future<Result<AppUser?>> register(
      String userName,
      String firstName,
      String lastName,
      String email,
      String password,
      String rePassword,
      String phone) {
    return executeApi<AppUser>(
      () async {
        var requestBody = RegisterRequest(
            userName: userName,
            firstName: firstName,
            lastName: lastName,
            email: email,
            password: password,
            rePassword: rePassword,
            phone: phone);
        var result = await apiManager.register(requestBody);
        return Success(result.user?.toAppUser());
      },
    );
  }

  @override
  Future<Result<AppUser?>> forgotPassword(String email) {
    return executeApi<AppUser?>(() async {
      var result = await apiManager.forgotPassword(
        email,
      );
      return Success(result.user?.toAppUser());
    });
  }

  @override
  Future<Result<AppUser?>> resetPassword(String email, String newPassword) {
    return executeApi<AppUser?>(
      () async {
        var result = await apiManager.resetPassword(email, newPassword);
        return Success(result.user?.toAppUser());
      },
    );
  }

  @override
  Future<Result<AppUser?>> verifyResetCode(String resetCode) {
    return executeApi<AppUser?>(
      () async {
        var result = await apiManager.verifyResetCode(resetCode);
        return Success(result.user?.toAppUser());
      },
    );
  }
}
