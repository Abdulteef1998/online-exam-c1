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
import '../data/repo/auth_repo.dart' as _i985;
import '../dataSource/contracts/auth_data_source.dart' as _i581;
import '../domain/contract/repo/auth_repo.dart' as _i156;
import '../use_case/auth_use_case.dart' as _i772;

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
    gh.factory<_i156.AuthRepo>(
        () => _i985.AuthRepositoryImpl(gh<_i581.AuthDataSource>()));
    gh.factory<_i772.AuthUseCase>(
        () => _i772.AuthUseCase(gh<_i156.AuthRepo>()));
    return this;
  }
}
