import 'package:equatable/equatable.dart';

import '../../../domain/entities/episodesEntities/info_episodes_entity.dart';

class InfoEpisodesModel extends Equatable {
  final int? count;
  final int? pages;
  final String? next;
  final String? prev;

  const InfoEpisodesModel({this.count, this.pages, this.next, this.prev});

  @override
  List<Object?> get props => [
        count,
        pages,
        next,
        prev,
      ];

  factory InfoEpisodesModel.fromJson(Map<String, dynamic> json) =>
      InfoEpisodesModel(
        count: json['count'],
        pages: json['pages'],
        next: json['next'],
        prev: json['prev'],
      );

  InfoEpisodesEntity toEntity() => InfoEpisodesEntity(
        count: count,
        pages: pages,
        next: next,
        prev: prev,
      );
}
