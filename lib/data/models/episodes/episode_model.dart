import 'package:equatable/equatable.dart';

import '../../../domain/entities/episodesEntities/episode_entity.dart';

class EpisodeModel extends Equatable {
  final int? id;
  final String? name;
  final String? airDate;
  final String? episode;
  final String? url;
  final String? created;

  const EpisodeModel({
    this.id,
    this.name,
    this.airDate,
    this.episode,
    this.url,
    this.created,
  });

  factory EpisodeModel.fromJson(Map<String, dynamic> json) => EpisodeModel(
      id: json['id'],
      name: json['name'],
      airDate: json['airDate'],
      episode: json['episode'],
      url: json['url'],
      created: json['created']);

  EpisodeEntity toEntity() => EpisodeEntity(
        id: id,
        name: name,
        airDate: airDate,
        episode: episode,
        url: url,
        created: created,
      );

  @override
  List<Object?> get props => [
        id,
        name,
        airDate,
        episode,
        url,
        created,
      ];
}
