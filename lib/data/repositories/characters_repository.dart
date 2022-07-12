import 'package:dartz/dartz.dart';

import '../../core/erros/exception.dart';
import '../../core/erros/failures.dart';
import '../../domain/entities/response_entity.dart';
import '../../domain/repositories/i_characters_repository.dart';
import '../datasources/characters_data_source.dart';

class CharactersRepository implements ICharactersRepository {
  final ICharactersDataSource remoteDataSource;

  CharactersRepository(this.remoteDataSource);

  @override
  Future<Either<Failure, Response>> charactersList() async {
    try {
      var charListModel = await remoteDataSource.charactersList();
      final entity = charListModel.toEntity();
      return Right(entity);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Response>> nextPage(String url) async {
    try {
      var nextPageModel = await remoteDataSource.nextPage(url);
      final entity = nextPageModel.toEntity();
      return Right(entity);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, Response>> prevPage(String url) async {
    try {
      var prevPageModel = await remoteDataSource.prevPage(url);
      final entity = prevPageModel.toEntity();
      return Right(entity);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
