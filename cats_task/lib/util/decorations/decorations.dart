import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Decorations{
  static const backgroundMainDecoration =  BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blue,Colors.white])
  );
}