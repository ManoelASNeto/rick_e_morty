import 'package:bloc/bloc.dart';
import 'package:rick_e_morty/core/erros/failures.dart';
import 'package:rick_e_morty/domain/usecases/get_characters.dart';
import 'package:rick_e_morty/presentation/bloc/characters_state.dart';

import '../../domain/usecases/next_usecase.dart';
import '../../domain/usecases/prev_usecase.dart';

part 'characters_event.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final GetCharacters getCharacters;
  final NextCharacters nextPage;
  final PrevCharacters prevPage;

  CharactersBloc(
    this.getCharacters,
    this.nextPage,
    this.prevPage,
  ) : super(const CharactersState.initial()) {
    on<AllCharacters>(
      (event, emit) async {
        emit(state.loading());
        var fold = await getCharacters();
        emit(await fold.fold(
          (failure) => state.error(_mapCharactersFailureToString(failure)),
          (characters) => state.ready(characters),
        ));
      },
    );
    on<PrevPage>(
      (event, emit) async {
        emit(state.loading());
        var fold = await nextPage;
        emit(
          await fold.fold(
            (failure) => state.error(
              _mapCharactersFailureToString(failure),
            ),
            (response) => state.ready(response),
          ),
        );
      },
    );
    on<NextPage>(
      (event, emit) async {
        emit(state.loading());
        var fold = await nextPage;
        emit(await fold.fold(
            (failure) => state.error(_mapCharactersFailureToString(failure)),
            (response) => state.ready(response)));
      },
    );
  }
}

String _mapCharactersFailureToString(Failure failure) {
  switch (failure.runtimeType) {
    case ServerFailure:
      return 'Erro ao conectar ao servidor';
    default:
      return 'Erro tente novamente';
  }
}
