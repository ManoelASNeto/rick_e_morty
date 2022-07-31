import 'package:dartz/dartz.dart';

import '../../core/erros/failures.dart';
import '../entities/response_entity.dart';
import '../repositories/i_characters_repository.dart';

class NextCharacters {
  final ICharactersRepository repository;

  NextCharacters(this.repository);
  Future<Either<Failure, Response>> call(String url) async {
    return await repository.nextPage(url);
  }
}
