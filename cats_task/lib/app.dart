import 'package:cats_task/pages/history_page/history_page.dart';
import 'package:cats_task/pages/main_page/main_page.dart';
import 'package:flutter/material.dart';


class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/main': (context) => MainPage(),
        '/history': (context) => HistoryPage()
      },
      initialRoute: '/main',
    );
  }
}
