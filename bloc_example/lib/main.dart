import 'package:bloc_example/pages/cubit_example/counter_cubit_page.dart';
import 'package:bloc_example/pages/multi_bloc/multibloc_page.dart';
import 'package:flutter/material.dart';

import 'pages/bloc_example/counter_main_page.dart';

void main() {
  runApp(const MyApp());
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

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bloc example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextButton(
                onPressed: () => context.push(const CounterCubitPage()),
                child: const Text('Cubit example'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextButton(
                onPressed: () => context.push(const CounterBlocPage()),
                child: const Text('Bloc example'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: TextButton(
                onPressed: () => context.push(const MultiblocPage()),
                child: const Text('Multi bloc example'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

extension BuildContextExtension on BuildContext {
  Future<T?> push<T extends Object?>(Widget widget) =>
      Navigator.of(this).push(MaterialPageRoute(builder: (_) => widget));

  void pop<T extends Object?>(T? result) => Navigator.of(this).pop(result);
}
