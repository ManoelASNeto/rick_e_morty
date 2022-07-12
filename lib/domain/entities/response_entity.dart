import 'package:equatable/equatable.dart';
import 'package:rick_e_morty/domain/entities/characters_entity.dart';
import 'package:rick_e_morty/domain/entities/info_entity.dart';

class Response extends Equatable {
  final InfoEntity? infoEntity;
  final List<CharactersEntity>? results;

  const Response({this.infoEntity, this.results});

  @override
  List<Object?> get props => [
        infoEntity,
        results,
      ];
}
