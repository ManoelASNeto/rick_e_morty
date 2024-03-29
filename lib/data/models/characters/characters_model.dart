import 'package:equatable/equatable.dart';
import 'package:rick_e_morty/domain/entities/charactersEntities/characters_entity.dart';

import 'location_model.dart';
import 'origin_model.dart';

class CharactesModel extends Equatable {
  final int? id;
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  final String? image;
  final String? url;
  final String? created;
  final Location? location;
  final Origin? origin;

  const CharactesModel({
    this.id,
    this.name,
    this.status,
    this.species,
    this.type,
    this.gender,
    this.image,
    this.url,
    this.created,
    this.location,
    this.origin,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        status,
        species,
        type,
        gender,
        image,
        url,
        created,
        location,
        origin,
      ];

  factory CharactesModel.fromJson(Map<String, dynamic> json) => CharactesModel(
        id: json['id'],
        name: json['name'],
        status: json['status'],
        species: json['species'],
        type: json['type'],
        gender: json['gender'],
        image: json['image'],
        url: json['url'],
        created: json['created'],
        location: Location.fromJson(json['location']),
        origin: Origin.fromJson(json['origin']),
      );

  CharactersEntity toEntity() => CharactersEntity(
        id: id,
        name: name,
        status: status,
        species: species,
        type: type,
        gender: gender,
        image: image,
        url: url,
        created: created,
        location: location,
        origin: origin,
      );
}
