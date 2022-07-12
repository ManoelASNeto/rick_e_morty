part of 'characters_bloc.dart';

abstract class CharactersEvent {}

class AllCharacters extends CharactersEvent {}

class NextPage extends CharactersEvent {
  String nextPage;

  NextPage(
    this.nextPage,
  );
}

class PrevPage extends CharactersEvent {
  String prevPage;

  PrevPage(
    this.prevPage,
  );
}
