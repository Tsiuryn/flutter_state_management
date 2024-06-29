import 'package:bloc_example/pages/bloc_example/bloc/counter_main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBlocPage extends StatelessWidget {
  const CounterBlocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterMainBloc>(
      create: (_) => CounterMainBloc(),
      child: BlocBuilder<CounterMainBloc, CounterMainState>(builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text('Counter, pushed - ${state.model.value.toString()}'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('You have pushed:'),
                Text(
                  state.model.value.toString(),
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
                  onPressed: (){
                    BlocProvider.of<CounterMainBloc>(context).add(const CounterMainEvent.increment());
                  },
                  child: const Icon(Icons.add),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                  tooltip: 'Decrement',
                  heroTag: 'Decrement',
                  onPressed: (){
                    context.read<CounterMainBloc>().add(const CounterMainEvent.decrement());
                  },
                  child: const Icon(Icons.remove),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}