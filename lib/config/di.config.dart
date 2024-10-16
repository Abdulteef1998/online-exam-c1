// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/api_manager/api_manager.dart' as _i1000;
import '../data/repo/auth_repo_impl.dart' as _i345;
import '../dataSource/contracts/auth_data_source.dart' as _i581;
import '../dataSource/impl/auth_data_source_impl.dart' as _i802;
import '../domain/contract/repo/auth_repo.dart' as _i156;
import '../domain/usecase/auth_use_case.dart' as _i959;
import '../view_model/forgot_password_view_model/forgot_password_view_model.dart'
    as _i254;
import '../view_model/signIn_view_model/signin_view_model.dart' as _i1021;
import '../view_model/signUp_view_model/signup_view_model.dart' as _i89;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.singleton<_i1000.ApiManager>(() => _i1000.ApiManager());
    gh.factory<_i581.AuthDataSource>(
        () => _i802.AuthDatasourceImpl(gh<_i1000.ApiManager>()));
    gh.factory<_i156.AuthRepo>(
        () => _i345.AuthRepositoryImpl(gh<_i581.AuthDataSource>()));
    gh.factory<_i959.AuthUseCase>(
        () => _i959.AuthUseCase(gh<_i156.AuthRepo>()));
    gh.factory<_i254.ForgotViewModel>(
        () => _i254.ForgotViewModel(gh<_i959.AuthUseCase>()));
    gh.factory<_i89.SignupViewModel>(
        () => _i89.SignupViewModel(gh<_i959.AuthUseCase>()));
    gh.factory<_i1021.LoginViewModel>(
        () => _i1021.LoginViewModel(gh<_i959.AuthUseCase>()));
    return this;
  }
}
