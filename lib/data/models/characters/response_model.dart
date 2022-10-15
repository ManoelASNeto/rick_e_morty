import 'package:equatable/equatable.dart';
import 'package:rick_e_morty/data/models/characters/characters_model.dart';
import 'package:rick_e_morty/data/models/characters/info_model.dart';

import '../../../domain/entities/charactersEntities/response_entity.dart';

class ResponseModel extends Equatable {
  final Info? info;
  final List<CharactesModel>? results;

  const ResponseModel({this.info, this.results});

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      info: Info.fromJson(json['info']),
      results: json['results'] != null
          ? (json['results'] as List)
              .map((e) => CharactesModel.fromJson(e))
              .toList()
          : null,
    );
  }

  Response toEntity() => Response(
        infoEntity: info?.toEntity(),
        results: results?.map((e) => e.toEntity()).toList(),
      );

  @override
  List<Object?> get props => [
        info,
        results,
      ];
}
