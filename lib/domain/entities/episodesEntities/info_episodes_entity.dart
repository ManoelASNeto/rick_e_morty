import 'package:equatable/equatable.dart';

class InfoEpisodesEntity extends Equatable {
  final int? count;
  final int? pages;
  final String? next;
  final String? prev;

  const InfoEpisodesEntity({
    this.count,
    this.pages,
    this.next,
    this.prev,
  });

  @override
  List<Object?> get props => [
        count,
        pages,
        next,
        prev,
      ];
}
