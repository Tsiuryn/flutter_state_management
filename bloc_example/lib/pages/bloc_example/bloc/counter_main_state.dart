part of 'counter_main_bloc.dart';

sealed class CounterMainState {
  final CounterMainBlocModel model;

  const CounterMainState(this.model);

  factory CounterMainState.initial() =>
      const InitialState(CounterMainBlocModel.empty());

  const factory CounterMainState.updatePage(CounterMainBlocModel model) = UpdatePageState;
}

class InitialState extends CounterMainState {
  const InitialState(super.model);
}

class UpdatePageState extends CounterMainState {
  const UpdatePageState(super.model);
}
  