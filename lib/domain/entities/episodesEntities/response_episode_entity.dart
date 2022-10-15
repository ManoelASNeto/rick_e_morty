import 'package:equatable/equatable.dart';
import 'package:rick_e_morty/domain/entities/episodesEntities/episode_entity.dart';
import 'package:rick_e_morty/domain/entities/episodesEntities/info_episodes_entity.dart';

class ResponseEpisodesEntity extends Equatable {
  final InfoEpisodesEntity? infoEpisodesEntity;
  final List<EpisodeEntity>? response;

  const ResponseEpisodesEntity({this.infoEpisodesEntity, this.response});

  @override
  List<Object?> get props => [
        infoEpisodesEntity,
        response,
      ];
}
