import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class ServerFailure implements Failure {
  @override
  List<Object> get props => [];

  @override
  bool? get stringify => true;
}
