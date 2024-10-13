import 'package:injectable/injectable.dart';
import 'package:online_exam_c1_online/data/base/result.dart';
import 'package:online_exam_c1_online/domain/app_user.dart';
import 'package:online_exam_c1_online/domain/contract/repo/auth_repo.dart';

@Injectable()
class AuthUseCase {
  AuthRepo authRepo;

  AuthUseCase(this.authRepo);

  Future<Result<AppUser?>> invoke(String email, String password) {
    return authRepo.login(email, password);
  }

  Future<Result<AppUser?>> invokeRegister(
    String userName,
    String firstName,
    String lastName,
    String email,
    String password,
    String rePassword,
    String phone,
  ) {
    return authRepo.register(
        userName, firstName, lastName, email, password, rePassword, phone);
  }

  Future<Result<AppUser?>> invokeForgotPassword(String email) {
    return authRepo.forgotPassword(email);
  }

  Future<Result<AppUser?>> invokeVerifyResetCode(String resetCode) {
    return authRepo.verifyResetCode(resetCode);
  }

  Future<Result<AppUser?>> invokeResetPassword(String email, String newPassword) {
    return authRepo.resetPassword(email, newPassword);
  }
}
