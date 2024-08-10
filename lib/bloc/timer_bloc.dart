import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:timer_app/data/ticker.dart';

part 'timer_event.dart';
part 'timer_state.dart';

class TimerBloc extends Bloc<TimerEvent, TimerState> {
  static const int duration = 60;
  final Ticker _ticker;
  StreamSubscription<int>? streamSubscription;
  TimerBloc({required Ticker ticker})
      : _ticker = ticker,
        super(const TimerInitial(duration)) {
    on<TimerStartEvent>(onStart);
    on<TimerTickedEvent>(onTicked);
    on<TimerStopEvent>(onStop);
    on<TimerResumEvent>(onResume);
    on<TimerResetEvent>(onReset);
  }

  @override
  Future<void> close() {
    streamSubscription!.cancel();
    return super.close();
  }

  // function to handle the timer start event
  void onStart(TimerStartEvent event, Emitter<TimerState> emit) {
    emit(TimerWorkingState(event.duration));
    streamSubscription?.cancel();
    streamSubscription = _ticker
        .tick(ticks: event.duration)
        .listen((duration) => add(TimerTickedEvent(duration: duration)));
  }

  // function to handle ticked event
  void onTicked(TimerTickedEvent event, Emitter<TimerState> emit) {
    emit(duration > 0
        ? TimerWorkingState(event.duration)
        : const TimerStopState());
  }

  //function to handle stop event
  void onStop(TimerStopEvent event, Emitter<TimerState> emit) {
    if (state is TimerWorkingState) {
      streamSubscription?.pause();
      emit(TimerPausedState(state.duration));
    }
  }

  void onResume(TimerResumEvent event, Emitter<TimerState> emit) {
    if (state is TimerPausedState) {
      streamSubscription?.resume();
      emit(TimerWorkingState(state.duration));
    }
  }

  void onReset(TimerResetEvent event, Emitter<TimerState> emit) {
    streamSubscription?.cancel();
    emit(const TimerInitial(duration));
  }
}
