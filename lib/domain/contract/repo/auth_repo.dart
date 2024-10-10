import 'package:online_exam_c1_online/data/base/api_extensions.dart';
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
}
