import  'package:flutter/material.dart';

class SwitchesDemoScreen extends StatefulWidget {
  const SwitchesDemoScreen({Key? key}) : super(key: key);

  @override
  _SwitchesDemoScreenState createState() => _SwitchesDemoScreenState();
}

class _SwitchesDemoScreenState extends State<SwitchesDemoScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(children: [
            Checkbox(value: false, onChanged: (val){}),
          ],),
        ),
      )
    );
  }
}
