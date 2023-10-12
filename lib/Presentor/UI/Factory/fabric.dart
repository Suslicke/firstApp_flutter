import 'package:flutter/material.dart';

import '../Element/dropdown.dart';
import '../Element/button.dart';
import 'package:flutter_application_1/Domain/Operation.dart';

abstract class UIFabric {
  Button getButton({
    required String title,
    required Function() callBack,
  });

  DDButton getDDButton({
    required Operation? value,
    required items,
    required Function(Operation?) callBack,
  });
}

class AndroidFabric implements UIFabric {
  @override
  Button getButton({required String title, required Function() callBack}) {
    return AndroidButton(
      callBack: callBack,
      title: title,
    );
  }

  @override
  DDButton getDDButton(
      {required Operation? value,
      required items,
      required Function(Operation?) callBack}) {
    return AndroidDDButton(
      value: value,
      items: items,
      callBack: callBack,
    );
  }
}

class IOSFabric implements UIFabric {
  @override
  Button getButton({required String title, required Function() callBack}) {
    return IOSButton(
      callBack: callBack,
      title: title,
    );
  }

  @override
  DDButton getDDButton(
      {required Operation? value,
      required items,
      required Function(Operation?) callBack}) {
    return IOSDDButton(
      value: value,
      items: items,
      callBack: callBack,
    );
  }
}
