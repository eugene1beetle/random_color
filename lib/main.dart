import 'dart:math';

import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Color getRandomColor() => Color(Random().nextInt(0xffffffff)).withAlpha(0xff);
  Color? _randomScaffoldBackgroundColor;

  void refreshColor() {
    setState(() {
      _randomScaffoldBackgroundColor = getRandomColor();
    });
  }

  @override
  void initState() {
    refreshColor();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RandomColor Demo',
      theme: ThemeData(
        scaffoldBackgroundColor:
            _randomScaffoldBackgroundColor ?? Colors.blueAccent,
      ),
      home: GestureDetector(
        onTap: refreshColor,
        // // if we want change color on any release
        // onPanEnd: (_) => refreshColors(),
        child: const Scaffold(
          body: Center(
            child: Text(
              'Hey there',
              style: TextStyle(
                fontSize: 28,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
