part of 'handwash_bloc.dart';

abstract class HandwashEvent extends Equatable {
  const HandwashEvent();
}

class GetHandwashEvent extends HandwashEvent {
  const GetHandwashEvent();

  @override
  List<Object?> get props => [];
}

class GetHandwashByIdEvent extends HandwashEvent {
  const GetHandwashByIdEvent(this.id);
  final String id;

  @override
  List<Object?> get props => [id];
}

class UpdateHandwashStateEvent extends HandwashEvent {
  const UpdateHandwashStateEvent(this.state);
  final bool state;

  @override
  List<Object?> get props => [state];
}



