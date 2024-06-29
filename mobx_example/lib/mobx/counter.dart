import 'package:mobx/mobx.dart';

part 'counter.g.dart';

// This is the class used by rest of your codebase
class Counter = CounterBase with _$Counter;

// The store-class
abstract class CounterBase with Store {
  final int initState;

  CounterBase(this.initState){
    value = initState;
  }

  @observable
  int value = 0;

  @action
  Future<void> increment()async{
    value ++;
  }

  @action
  void decrement(){
    value --;
  }
}