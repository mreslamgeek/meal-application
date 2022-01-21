import 'package:flutter/material.dart';
import 'package:new_gradient_app_bar/new_gradient_app_bar.dart';

//i create this class for something like repeat the same widget on whole app

class MyCustomGradientAppBar extends NewGradientAppBar {
  final String titleText;
  final bool iscenterTitle;
  final List<Widget> myActions;

  MyCustomGradientAppBar(
    this.titleText, {
    this.iscenterTitle = false,
    this.myActions,
  }) : super(
          title: Text(titleText),
          gradient: const LinearGradient(
            colors: [
              Color(0xffFED2A1),
              Color(0xff644431),

              // Colors.cyan,
              // Colors.indigo,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          centerTitle: iscenterTitle,
          actions: myActions,
        );
}
