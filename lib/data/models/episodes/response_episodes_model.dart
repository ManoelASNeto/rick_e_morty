import 'package:equatable/equatable.dart';
import 'package:rick_e_morty/data/models/episodes/episode_model.dart';
import 'package:rick_e_morty/data/models/episodes/info_episodes_model.dart';

import '../../../domain/entities/episodesEntities/response_episode_entity.dart';

class ResponseEpisodesModel extends Equatable {
  final InfoEpisodesModel? infoEpisodesModel;
  final List<EpisodeModel>? response;

  const ResponseEpisodesModel({this.infoEpisodesModel, this.response});

  factory ResponseEpisodesModel.fromJson(Map<String, dynamic> json) {
    return ResponseEpisodesModel(
      infoEpisodesModel: InfoEpisodesModel.fromJson(json['infoEpisodesModel']),
      response: json['response'] != null
          ? (json['response'] as List)
              .map((e) => EpisodeModel.fromJson(e))
              .toList()
          : null,
    );
  }

  ResponseEpisodesEntity toEntity() => ResponseEpisodesEntity(
        infoEpisodesEntity: infoEpisodesModel?.toEntity(),
        response: response?.map((e) => e.toEntity()).toList(),
      );

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
