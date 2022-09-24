import 'package:cats_task/bloc/cats_fact_bloc.dart';
import 'package:cats_task/pages/main_page/widgets/rand_cat_facts_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../util/decorations/decorations.dart';
import '../../util/text_styles/text_styles.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CatsFactBloc>(
      create: (context) => CatsFactBloc(),
      child: Scaffold(
        appBar: AppBar(
            title: Row(
          children: [
            const Text('Cats Fact'),
            const Spacer(),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed('/history');
                },
                child: const Text('Fact history',
                    style: TextStyles.factHistoryTextStyle))
          ],
        )),
        body: Container(
            height: double.maxFinite,
            decoration: Decorations.backgroundMainDecoration,
            child: RandCatFactsWidget()),
      ),
    );
  }
}
