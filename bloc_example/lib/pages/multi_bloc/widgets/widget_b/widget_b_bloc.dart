import 'package:bloc/bloc.dart';

class WidgetBBloc extends Cubit<String>{
  WidgetBBloc(): super('');

  void updateMessage(String message){
    emit(message);
  }
}