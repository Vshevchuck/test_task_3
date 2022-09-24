import 'package:cats_task/pages/history_page/widgets/history_list_widget.dart';
import 'package:cats_task/util/decorations/decorations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/cats_fact_bloc.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CatsFactBloc>(
      create: (context) => CatsFactBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Cats Fact'),
        ),
        body: Container(
            height: double.maxFinite,
            decoration: Decorations.backgroundMainDecoration,
            child: const HistoryListWidget()),
      ),
    );
  }
}
