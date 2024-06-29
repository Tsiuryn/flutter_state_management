import 'package:flutter_bloc/flutter_bloc.dart';


class CounterCubitBloc extends Cubit<int> {
  CounterCubitBloc() : super(33);


  Future<void> increment() async{
    emit(state + 1);
  }

  Future<void> decrement() async{
    emit(state - 1);
  }
}
