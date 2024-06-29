import 'package:flutter_bloc/flutter_bloc.dart';

part 'counter_main_event.dart';

part 'counter_main_state.dart';

part 'counter_main_bloc_model.dart';

class CounterMainBloc extends Bloc<CounterMainEvent, CounterMainState> {
  CounterMainBloc() : super(CounterMainState.initial()) {
    on<IncrementEvent>(_onIncrementEvent);
    on<DecrementEvent>(_onDecrementEvent);
  }

  Future<void> _onIncrementEvent(
    IncrementEvent event,
    Emitter<CounterMainState> emit,
  ) async {
    emit(CounterMainState.updatePage(state.model.copyWith(value: state.model.value + 1)));
  }

  Future<void> _onDecrementEvent(
      DecrementEvent event,
    Emitter<CounterMainState> emit,
  ) async {
    emit(CounterMainState.updatePage(state.model.copyWith(value: state.model.value - 1)));

  }
}
