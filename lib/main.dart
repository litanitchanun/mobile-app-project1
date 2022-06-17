import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'nameEntering.dart';
import 'colors.dart';
import 'fortuneWheel.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: InsertNamePage(),
      theme: ThemeData(
          primaryColor: green,
          scaffoldBackgroundColor:beige,
      ),
      // initialRoute: '/',
      // routes: {
      //   '/': (context) => InsertNamePage(),
      //   // '/wheel': (context) => WheelPage(nameController: ),
      //   // '/detail': (context) => DetailScreen(),
      //   // '/exdetail': (context) => ExtraDetailScreen(),
      // },
    );
  }
}

