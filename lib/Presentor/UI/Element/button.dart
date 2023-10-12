import 'package:flutter/material.dart';

abstract class Button extends StatelessWidget {
  final String title;
  final Function() callBack;

  Button({
    required this.title,
    required this.callBack,
  });
}

class AndroidButton extends Button {
  AndroidButton({required super.title, required super.callBack});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: Colors.black),
      child: Text(super.title),
      onPressed: super.callBack,
    );
  }
}

class IOSButton extends Button {
  IOSButton({required super.title, required super.callBack});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(primary: Color.fromARGB(255, 255, 0, 0)),
      child: Text(super.title),
      onPressed: super.callBack,
    );
  }
}
