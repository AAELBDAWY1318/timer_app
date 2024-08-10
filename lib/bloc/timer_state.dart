part of 'timer_bloc.dart';

sealed class TimerState extends Equatable {
  final int duration;
  const TimerState(this.duration);
  
  @override
  List<Object> get props => [duration];
}

final class TimerInitial extends TimerState {
  const TimerInitial(super.duration);

  @override
  String toString()=> "TimerInitial {duration : $duration}";
}

final class TimerStartState extends TimerState{
  const TimerStartState(super.duration);

  @override
  String toString() => "TimerStart {duration $duration}";
}

final class TimerWorkingState extends TimerState{
  const TimerWorkingState(super.duration);

  @override
  String toString() => "TimerWorking {duration $duration}";
}
final class TimerPausedState extends TimerState{
  const TimerPausedState(super.duration);

}
final class TimerStopState extends TimerState{
  const TimerStopState() : super(0);
}
