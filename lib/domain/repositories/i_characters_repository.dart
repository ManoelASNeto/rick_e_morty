import 'package:rick_e_morty/core/erros/failures.dart';
import 'package:dartz/dartz.dart';

import '../entities/response_entity.dart';

abstract class ICharactersRepository {
  Future<Either<Failure, Response>> charactersList();
  Future<Either<Failure, Response>> nextPage(String url);
  Future<Either<Failure, Response>> prevPage(String url);
}
