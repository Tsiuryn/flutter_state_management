import 'package:bloc_example/pages/multi_bloc/widgets/widget_b/widget_b_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WidgetB extends StatelessWidget {
  const WidgetB({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.red,
      child: BlocBuilder<WidgetBBloc, String>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                state.isEmpty ? 'Nothing found' : state,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.white,
                    ),
              ),
            ],
          );
        },
      ),
    );
  }
}
