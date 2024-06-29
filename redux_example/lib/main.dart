import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

// One simple action: Increment, Decrement
enum Actions { Increment, Decrement }

// The reducer, функция, которая принимает предыдущий state и action.
// Action может быть не enum, a например sealed class, как в блоке
// Action необходимо распарсить и вернуть новый state;
int counterReducer(int state, dynamic action) {
  return action == Actions.Increment
      ? state + 1
      : action == Actions.Decrement
          ? state - 1
          : state;
}

void main() {
  /// Инициализация Store, который на вход принимает функцию reducer и начальный state
  final store = Store<int>(counterReducer, initialState: 0);

  runApp(FlutterReduxApp(
    title: 'Flutter Redux Demo',
    store: store,
  ));
}

class FlutterReduxApp extends StatelessWidget {
  final Store<int> store;
  final String title;

  const FlutterReduxApp({
    required this.store,
    required this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    /// The StoreProvider widget который на вход принимает store
    return StoreProvider<int>(
      // Pass the store to the StoreProvider. Any ancestor `StoreConnector`
      // Widgets will find and use this value as the `Store`.
      store: store,
      child: MaterialApp(
        theme: ThemeData.dark(),
        title: title,
        home: Scaffold(
          appBar: AppBar(title: Text(title)),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                /// StoreConnector виджет, который подключается к store и через builder изменяет поддерево виджетов
                StoreConnector<int, String>(
                  converter: (store) => store.state.toString(),
                  builder: (context, count) {
                    return Text(
                      'The button has been pushed this many times: $count',
                      style: Theme.of(context).textTheme.bodyMedium,
                    );
                  },
                )
              ],
            ),
          ),
          floatingActionButton: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              /// StoreConnector виджет, типизирован int - стэйт и
              /// VoidCallback - функция обратного вызова для изменения состояния по нажатию на кнопку
              StoreConnector<int, VoidCallback>(
                converter: (store) {
                  return () => store.dispatch(Actions.Increment);
                },
                builder: (context, callback) {
                  return FloatingActionButton(
                    onPressed: callback,
                    tooltip: 'Increment',
                    child: Icon(Icons.add),
                  );
                },
              ),
              const SizedBox(
                height: 16,
              ),
              StoreConnector<int, Function(Actions)>(
                converter: (store) {
                  return (action) => store.dispatch(action);
                },
                builder: (context, callback) {
                  return FloatingActionButton(
                    // Attach the `callback` to the `onPressed` attribute
                    onPressed: () {
                      callback(Actions.Decrement);
                    },
                    tooltip: 'Decrement',
                    child: const Icon(Icons.remove),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
