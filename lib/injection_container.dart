import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:rick_e_morty/core/device/network_info.dart';
import 'package:http/http.dart' as http;
import 'package:rick_e_morty/data/datasources/characters_data_source.dart';
import 'package:rick_e_morty/data/repositories/characters_repository.dart';
import 'package:rick_e_morty/domain/repositories/i_characters_repository.dart';
import 'package:rick_e_morty/domain/usecases/get_characters.dart';
import 'package:rick_e_morty/domain/usecases/next_usecase.dart';
import 'package:rick_e_morty/domain/usecases/prev_usecase.dart';
import 'package:rick_e_morty/presentation/bloc/characters_bloc.dart';

final sl = GetIt.instance;
Future<void> init() async {
  sl.registerLazySingleton<INetworkInfo>(() => NetworkInfo(sl()));
  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton(() => http.Client());

  sl.registerLazySingleton(() => CharactersBloc(sl(), sl(), sl()));
  sl.registerLazySingleton(() => GetCharacters(sl()));
  sl.registerLazySingleton(() => NextCharacters(sl()));
  sl.registerLazySingleton(() => PrevCharacters(sl()));
  sl.registerLazySingleton<ICharactersRepository>(
      () => CharactersRepository(sl()));
  sl.registerLazySingleton<ICharactersDataSource>(
      () => CharactersDataSource(sl()));

  await sl.allReady();
}
