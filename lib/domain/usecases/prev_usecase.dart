import 'package:dartz/dartz.dart';
import 'package:rick_e_morty/core/erros/failures.dart';
import 'package:rick_e_morty/domain/entities/response_entity.dart';
import 'package:rick_e_morty/domain/repositories/i_characters_repository.dart';

class PrevCharacters {
  final ICharactersRepository repository;

  PrevCharacters(this.repository);
  Future<Either<Failure, Response>> call(String url) async {
    return await repository.prevPage(url);
  }
}
