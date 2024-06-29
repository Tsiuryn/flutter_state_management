import 'package:bloc_example/pages/multi_bloc/widgets/widget_a/widget_a_bloc.dart';
import 'package:bloc_example/pages/multi_bloc/widgets/widget_b/widget_b_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetA extends StatelessWidget {
  const WidgetA({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.yellow,
      child: BlocConsumer<WidgetABloc, int>(
        listener: (context, state) {
          context.read<WidgetBBloc>().updateMessage('Data from ABloc $state');
        },
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text('My state is $state', style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white,
              ),),
              const Spacer(),
              OutlinedButton(
                onPressed: () {
                  context.read<WidgetABloc>().increment();
                },
                child: const Text('Send data to another bloc'),
              ),
              const Spacer(),
            ],
          );
        }
      ),
    );
  }
}
