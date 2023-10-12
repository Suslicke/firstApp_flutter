import 'package:flutter_application_1/Domain/Operation.dart';

class Calculations {
  static Operation StartSum() {
    return Addition();
  }

  static Operation StartSub() {
    return Subtraction();
  }

  static Operation StartMult() {
    return Multiplication();
  }

  static Operation StartDiv() {
    return Division();
  }

  static List<Operation> getAllOperations() {
    return [
      Addition(),
      Subtraction(),
      Multiplication(),
      Division(),
    ];
  }
}
