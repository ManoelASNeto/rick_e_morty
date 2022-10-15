import 'package:equatable/equatable.dart';

import '../../../data/models/characters/location_model.dart';
import '../../../data/models/characters/origin_model.dart';

class CharactersEntity extends Equatable {
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

  const CharactersEntity({
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
}
