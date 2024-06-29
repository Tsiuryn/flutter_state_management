import 'package:bloc/bloc.dart';

class WidgetABloc extends Cubit<int> {
  WidgetABloc(): super(0);

  void increment(){
    emit(state + 1);
  }
}