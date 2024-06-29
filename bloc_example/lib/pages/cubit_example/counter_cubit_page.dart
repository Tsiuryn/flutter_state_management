import 'package:bloc_example/pages/cubit_example/bloc/counter_cubit_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubitPage extends StatelessWidget {
  const CounterCubitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubitBloc>(
      create: (_) => CounterCubitBloc(),
      child: BlocBuilder<CounterCubitBloc, int>(builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Counter, pushed - ${state.toString()}'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('You have pushed:'),
                Text(
                  state.toString(),
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
          floatingActionButton: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  tooltip: 'Increment',
                  heroTag: 'Increment',
                  onPressed:
                      BlocProvider.of<CounterCubitBloc>(context).increment,
                  child: const Icon(Icons.add),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  tooltip: 'Decrement',
                  heroTag: 'Decrement',
                  onPressed: context.read<CounterCubitBloc>().decrement,
                  child: const Icon(Icons.remove),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  heroTag: 'Bottom sheet',
                  onPressed: () {
                    showBottomSheet(context);
                  },
                  child: const Icon(Icons.vertical_align_bottom_sharp),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        showDragHandle: true,
        builder: (_) {
          /// Если необходимо достучаться к блоку не создавая его
          return BlocProvider<CounterCubitBloc>.value(
            value: context.read<CounterCubitBloc>(),
            child:
                BlocBuilder<CounterCubitBloc, int>(builder: (context, state) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    children: [
                      Expanded(
                          child: Text(
                        'Current state is $state',
                        textAlign: TextAlign.center,
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  TextButton(
                    onPressed: context.read<CounterCubitBloc>().increment,
                    child: const Text('Change state from bottomSheet'),
                  ),
                ],
              );
            }),
          );
        });
  }
}
