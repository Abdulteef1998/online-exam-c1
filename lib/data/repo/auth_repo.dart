import 'package:injectable/injectable.dart';
import 'package:online_exam_c1_online/data/base/result.dart';
import 'package:online_exam_c1_online/dataSource/contracts/auth_data_source.dart';
import 'package:online_exam_c1_online/domain/app_user.dart';
import 'package:online_exam_c1_online/domain/contract/repo/auth_repo.dart';

@Injectable(as: AuthRepo)
class AuthRepositoryImpl implements AuthRepo {
  AuthDataSource authDataSource;

  @factoryMethod
  AuthRepositoryImpl(this.authDataSource);

  @override
  Future<Result<AppUser?>> login(String email, String password) {
    return authDataSource.login(
      email,
      password,
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
    return authDataSource.register(
        userName, firstName, lastName, email, password, rePassword, phone);
  }
}
