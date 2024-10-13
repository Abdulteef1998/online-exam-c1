import 'package:online_exam_c1_online/data/base/result.dart';
import 'package:online_exam_c1_online/domain/app_user.dart';

abstract class AuthDataSource {
  Future<Result<AppUser?>> login(String email, String password);

  Future<Result<AppUser?>> register(
      String userName, String firstName, String lastName,
      String email, String password, String rePassword, String phone);

  Future<Result<AppUser?>> forgotPassword(String email);

  Future<Result<AppUser?>> verifyResetCode(String resetCode);

  Future<Result<AppUser?>> resetPassword(String email, String newPassword);
}
