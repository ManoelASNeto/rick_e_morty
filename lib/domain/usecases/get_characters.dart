import 'package:dartz/dartz.dart';
import 'package:rick_e_morty/core/erros/failures.dart';
import 'package:rick_e_morty/domain/entities/response_entity.dart';
import 'package:rick_e_morty/domain/repositories/i_characters_repository.dart';

class GetCharacters {
  final ICharactersRepository repository;

  GetCharacters(this.repository);
  Future<Either<Failure, Response>> call() async {
    return await repository.charactersList();
  }
}
