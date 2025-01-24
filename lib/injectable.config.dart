// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:http/http.dart' as _i519;
import 'package:injectable/injectable.dart' as _i526;

import 'core/network/clients/rest_api_clients.dart' as _i361;
import 'features/auth/data/repository/auth_repositories.dart' as _i634;
import 'features/auth/domain/repositorys/auth_repository_impl.dart' as _i857;
import 'features/auth/domain/usecases/sign_in_usecase.dart' as _i151;
import 'features/auth/presentation/signals/auth_signal.dart' as _i244;

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
    final restApiClient = _$RestApiClient();
    gh.singleton<_i519.Client>(() => restApiClient.client);
    gh.singleton<_i634.AuthRepository>(
        () => _i857.AuthRepositoryImpl(gh<_i519.Client>()));
    gh.lazySingleton<_i151.SignInUseCase>(
        () => _i151.SignInUseCase(gh<_i634.AuthRepository>()));
    gh.lazySingleton<_i244.AuthSignal>(
        () => _i244.AuthSignal(gh<_i151.SignInUseCase>()));
    return this;
  }
}

class _$RestApiClient extends _i361.RestApiClient {}
