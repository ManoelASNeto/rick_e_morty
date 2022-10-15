import 'package:equatable/equatable.dart';
import 'package:rick_e_morty/domain/entities/charactersEntities/response_entity.dart';

enum CharactersStatus {
  loading,
  ready,
  error,
}

class CharactersState extends Equatable {
  final CharactersStatus? status;
  final Response? response;
  final String? message;

  const CharactersState._(this.status, this.response, this.message);

  const CharactersState.initial()
      : this._(CharactersStatus.loading, null, null);

  CharactersState loading() {
    return CharactersState._(CharactersStatus.loading, response, message);
  }

  CharactersState ready(Response? response) {
    return CharactersState._(CharactersStatus.ready, response, message);
  }

  CharactersState error(String? msgError) {
    return CharactersState._(CharactersStatus.error, response, msgError);
  }

  @override
  List<Object?> get props => [status, response, message];
}
