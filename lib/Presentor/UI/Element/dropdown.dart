import 'package:flutter/material.dart';
import 'package:flutter_application_1/Domain/Operation.dart';

abstract class DDButton extends StatelessWidget {
  final Operation? value;
  // List<DropdownMenuItem<Operation>>
  final items;
  final Function(Operation?) callBack;

  DDButton({
    required this.value,
    required this.items,
    required this.callBack,
  });
}

class AndroidDDButton extends DDButton {
  AndroidDDButton(
      {required super.value, required super.items, required super.callBack});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Operation>(
      value: super.value,
      items: super.items,
      onChanged: super.callBack,
    );
  }
}

class IOSDDButton extends DDButton {
  IOSDDButton(
      {required super.value, required super.items, required super.callBack});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<Operation>(
      value: super.value,
      items: super.items,
      onChanged: super.callBack,
    );
  }
}
