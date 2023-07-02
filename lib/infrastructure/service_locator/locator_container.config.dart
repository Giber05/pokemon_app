// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:pokemon_app/infrastructure/architecture/cubits/messager/messenger_cubit.dart'
    as _i5;
import 'package:pokemon_app/infrastructure/http_client/http_client.dart' as _i4;
import 'package:pokemon_app/infrastructure/routing/router.dart' as _i3;
import 'package:pokemon_app/infrastructure/service_locator/modules/core_module.dart'
    as _i14;
import 'package:pokemon_app/modules/data/datasources/remote/sources/pokemons/pokemon_remote_dts.dart'
    as _i6;
import 'package:pokemon_app/modules/data/datasources/remote/sources/pokemons/pokemon_remote_dts_impl.dart'
    as _i7;
import 'package:pokemon_app/modules/data/repository_impls/pokemon_repo_impl.dart'
    as _i9;
import 'package:pokemon_app/modules/domain/repositories/pokemon_repo.dart'
    as _i8;
import 'package:pokemon_app/modules/domain/usecases/get_pokemon_detail.dart'
    as _i10;
import 'package:pokemon_app/modules/domain/usecases/get_pokemons.dart' as _i11;
import 'package:pokemon_app/modules/presentation/features/pokemon_detail/cubit/pokemon_detail_cubit.dart'
    as _i12;
import 'package:pokemon_app/modules/presentation/features/pokemons/cubit/pokemons_cubit.dart'
    as _i13;

extension GetItInjectableX on _i1.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final coreModule = _$CoreModule();
    gh.singleton<_i3.AppRouter>(coreModule.getAppRouter());
    gh.lazySingleton<_i4.BaseHttpClient>(() => _i4.RknHttpClient());
    gh.lazySingleton<_i5.MessengerCubit>(() => _i5.MessengerCubit());
    gh.factory<_i6.PokemonRemoteDts>(
        () => _i7.PokemonRemoteDtsImpl(gh<_i4.BaseHttpClient>()));
    gh.factory<_i8.PokemonRepo>(
        () => _i9.PokemonRepoImpl(gh<_i6.PokemonRemoteDts>()));
    gh.factory<_i10.GetPokemonDetail>(
        () => _i10.GetPokemonDetail(gh<_i8.PokemonRepo>()));
    gh.factory<_i11.GetPokemons>(() => _i11.GetPokemons(gh<_i8.PokemonRepo>()));
    gh.factory<_i12.PokemonDetailCubit>(() => _i12.PokemonDetailCubit(
          gh<_i10.GetPokemonDetail>(),
          gh<_i5.MessengerCubit>(),
        ));
    gh.factory<_i13.PokemonsCubit>(
        () => _i13.PokemonsCubit(gh<_i11.GetPokemons>()));
    return this;
  }
}

class _$CoreModule extends _i14.CoreModule {}
