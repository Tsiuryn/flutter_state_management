import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    /// ProviderScope виджет в который оборачивается все приложение
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class CounterState{
  final int value;
  final bool isTest;
  CounterState({required this.value, required this.isTest,});

  CounterState.empty(): value = 33, isTest = false;

  CounterState copyWith({
    int? value,
    bool? isTest,
  }) {
    return CounterState(
      value: value ?? this.value,
      isTest: isTest ?? this.isTest,
    );
  }
}

/// Providers are declared globally and specify how to create a state
final counterProvider = NotifierProvider<Counter, CounterState>(Counter.new);

class Counter extends Notifier<CounterState> {
  @override
  CounterState build() {
    return CounterState.empty();
  }

  Future<void> increment() async{
    await Future.delayed(const Duration(milliseconds: 1000));
    state = state.copyWith(value: state.value + 1);
  }

  void decrement(){
    state = state.copyWith(value: state.value - 1);
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Riverpod example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Consumer(
              builder: (context, ref, child) {
                final count = ref.watch(counterProvider);
                return Text(
                  '${count.value}',
                  key: const Key('counterState'),
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () => ref.read(counterProvider.notifier).increment(),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 16,),
          FloatingActionButton(
            onPressed: () => ref.read(counterProvider.notifier).decrement(),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
