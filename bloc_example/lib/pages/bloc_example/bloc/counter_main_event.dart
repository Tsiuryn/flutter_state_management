part of 'counter_main_bloc.dart';

abstract class CounterMainEvent {
  const CounterMainEvent();

  const factory CounterMainEvent.initial() = InitialEvent;

  const factory CounterMainEvent.increment() = IncrementEvent;

  const factory CounterMainEvent.decrement() = DecrementEvent;
}

class InitialEvent extends CounterMainEvent {
  const InitialEvent();
}

class IncrementEvent extends CounterMainEvent {
  const IncrementEvent();
}

class DecrementEvent extends CounterMainEvent {
  const DecrementEvent();
}
      