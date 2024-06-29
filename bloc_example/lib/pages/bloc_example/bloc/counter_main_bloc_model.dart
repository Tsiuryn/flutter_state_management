part of 'counter_main_bloc.dart';

class CounterMainBlocModel {
  final int value;

  const CounterMainBlocModel({
    required this.value,
  });

  const CounterMainBlocModel.empty() : value = 33;

  CounterMainBlocModel copyWith({
    int? value,
  }) {
    return CounterMainBlocModel(
      value: value ?? this.value,
    );
  }
}
