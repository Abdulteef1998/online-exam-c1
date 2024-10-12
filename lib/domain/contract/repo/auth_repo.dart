import 'package:online_exam_c1_online/data/base/result.dart';
import 'package:online_exam_c1_online/domain/app_user.dart';

abstract class AuthRepo {
  Future<Result<AppUser?>> login(
    String email,
    String password,
  );

  Future<Result<AppUser?>> register(
    String userName,
    String firstName,
    String lastName,
    String email,
    String password,
    String rePassword,
    String phone,
  );

  Future<Result<AppUser?>> forgotpassword(
    String email,
  );

  Future<Result<AppUser?>> verifyresetcode(
    String resetCode,
  );

  Future<Result<AppUser?>> resetpassword(
    String email,
    String newPassword,
  );
}
