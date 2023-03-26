import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:washing_hand_education/data/models/handwash_data_model.dart';

import '../../repositories/repositories.dart';

part 'handwash_event.dart';
part 'handwash_state.dart';

class HandwashBloc extends Bloc<HandwashEvent, HandwashState> {
  final HandwashRepository _repository;

  HandwashBloc(this._repository) : super(HandwashInitial()) {
    on<GetHandwashEvent>(_getHandwash);
    on<GetHandwashByIdEvent>(_getHandwashById);
    on<UpdateHandwashStateEvent>(_updateHandwashState);
  }

  Future<void> _getHandwash(GetHandwashEvent event, Emitter<HandwashState> emit) async {
    emit(HandwashLoading());
    try {
      await _repository.getHandwash();
      emit(const HandwashRetrieved());
    } catch (e) {
      debugPrint(e.toString());
      emit(HandwashError(e.toString()));
    }
  }

  Future<void> _getHandwashById(GetHandwashByIdEvent event, Emitter<HandwashState> emit) async {
    emit(HandwashLoading());
    try {
      HandwashDataModel model = await _repository.getHandwashById(event.id);
      emit(HandwashLoaded(model));
    } catch (e) {
      debugPrint(e.toString());
      emit(HandwashError(e.toString()));
    }
  }

  Future<void> _updateHandwashState(UpdateHandwashStateEvent event, Emitter<HandwashState> emit) async {
    emit(HandwashLoading());
    try {
      await _repository.updateHandwashState(event.state);
      emit(const HandwashRetrieved());
    } catch (e) {
      debugPrint(e.toString());
      emit(HandwashError(e.toString()));
    }
  }
}
