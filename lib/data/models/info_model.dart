import 'package:equatable/equatable.dart';
import 'package:rick_e_morty/domain/entities/info_entity.dart';

class Info extends Equatable {
  final int? count;
  final int? pages;
  final String? next;
  final String? prev;

  const Info({this.count, this.pages, this.next, this.prev});

  @override
  List<Object?> get props => [
        count,
        pages,
        next,
        prev,
      ];

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        count: json['count'],
        pages: json['pages'],
        next: json['next'],
        prev: json['prev'],
      );

  InfoEntity toEntity() => InfoEntity(
        count: count,
        pages: pages,
        next: next,
        prev: prev,
      );
}
