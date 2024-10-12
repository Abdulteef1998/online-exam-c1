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
  Future<Result<AppUser?>> forgotpassword(String email) {
    return executeApi<AppUser?>(() async {
      var result = await apiManager.forgotpassword(
        email,
      );
      return Success(result.user?.toAppUser());
    });
  }

  @override
  Future<Result<AppUser?>> resetpassword(String email, String newPassword) {
    return executeApi<AppUser?>(
      () async {
        var result = await apiManager.resetpassword(email, newPassword);
        return Success(result.user?.toAppUser());
      },
    );
  }

  @override
  Future<Result<AppUser?>> verifyresetcode(String resetCode) {
    return executeApi<AppUser?>(
      () async {
        var result = await apiManager.verifyresetcode(resetCode);
        return Success(result.user?.toAppUser());
      },
    );
  }
}
