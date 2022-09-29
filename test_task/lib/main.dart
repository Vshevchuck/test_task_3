import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int groupValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView(
        children: [
          CupertinoSegmentedControl<int>(
            groupValue: groupValue,
            padding: const EdgeInsets.all(8.0),
            children: const {
              0: Text('Користувач'),
              2: Text('Адміністратор'),
              3: Text('Властник')
            },
            onValueChanged: (groupValue) {
              print(groupValue);
              setState((){
                this.groupValue=groupValue;
              });
            },

          ),
        ],
      ),
    );
  }
}
