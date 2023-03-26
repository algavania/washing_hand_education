part of 'handwash_bloc.dart';

abstract class HandwashState extends Equatable {
  const HandwashState();
}

class HandwashInitial extends HandwashState {
  @override
  List<Object> get props => [];
}

class HandwashLoading extends HandwashState {
  @override
  List<Object> get props => [];
}

class HandwashRetrieved extends HandwashState {
  const HandwashRetrieved();

  @override
  List<Object> get props => [];
}

class HandwashLoaded extends HandwashState {
  const HandwashLoaded(this.model);
  final HandwashDataModel model;

  @override
  List<Object> get props => [model];
}

class HandwashError extends HandwashState {
  final String error;

  const HandwashError(this.error);

  @override
  List<Object> get props => [error];
}