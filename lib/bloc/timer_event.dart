part of 'timer_bloc.dart';

sealed class TimerEvent{
  const TimerEvent();
}

class TimerStartEvent extends TimerEvent{
  final int duration;

  TimerStartEvent({required this.duration});
  
}

class TimerStopEvent extends TimerEvent{
  const TimerStopEvent();
}

class TimerResumEvent extends TimerEvent{
  const TimerResumEvent();
}

class TimerResetEvent extends TimerEvent{
  const TimerResetEvent();
}

class TimerTickedEvent extends TimerEvent{
  final int duration;

  TimerTickedEvent({required this.duration});
  
}
