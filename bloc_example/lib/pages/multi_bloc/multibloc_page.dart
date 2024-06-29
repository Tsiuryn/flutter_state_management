import 'package:bloc_example/pages/multi_bloc/widgets/widget_a/widget_a.dart';
import 'package:bloc_example/pages/multi_bloc/widgets/widget_a/widget_a_bloc.dart';
import 'package:bloc_example/pages/multi_bloc/widgets/widget_b/widget_b.dart';
import 'package:bloc_example/pages/multi_bloc/widgets/widget_b/widget_b_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultiblocPage extends StatelessWidget {
  const MultiblocPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (ctx) => WidgetABloc(),
        ),
        BlocProvider(
          create: (ctx) => WidgetBBloc(),
        )
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Передача данных между блоками'),
        ),
        body: const Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: WidgetB(),
            ),
            Expanded(
              child: WidgetA(),
            ),
          ],
        ),
      ),
    );
  }
}
