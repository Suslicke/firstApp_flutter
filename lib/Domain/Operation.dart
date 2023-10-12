
abstract class Operation {
  String shortName();
  String longName();
  double? operation(double? num1, double? num2);
}

class Addition implements Operation {
  @override
  String longName() => "Addition";

  @override
  double? operation(double? num1, double? num2) {
    return (num1 ?? 0) + (num2 ?? 0);
  }

  @override
  String shortName() => "+";

  @override
  bool operator ==(Object object) =>
      object is Operation && object.shortName() == shortName();

  @override
  int get hashCode => shortName().hashCode;
}

class Subtraction implements Operation {
  @override
  String longName() => "Subtraction";

  @override
  double? operation(double? num1, double? num2) {
    return (num1 ?? 0) - (num2 ?? 0);
  }

  @override
  String shortName() => "-";

  @override
  bool operator ==(Object object) =>
      object is Operation && object.shortName() == shortName();

  @override
  int get hashCode => shortName().hashCode;
}

class Multiplication implements Operation {
  @override
  String longName() => "Multiplication";

  @override
  double? operation(double? num1, double? num2) {
    return (num1 ?? 0) * (num2 ?? 0);
  }

  @override
  String shortName() => "*";

  @override
  bool operator ==(Object object) =>
      object is Operation && object.shortName() == shortName();

  @override
  int get hashCode => shortName().hashCode;
}

class Division implements Operation {
  @override
  String longName() => "Division";

  @override
  double? operation(double? num1, double? num2) {
    if (num2 == 0 || num2 == null) {
      return null;
    } else if (num1 == null) {
      return 0;
    } else {
      return num1 / num2;
    }
  }

  @override
  String shortName() => "/";

  @override
  bool operator ==(Object object) =>
      object is Operation && object.shortName() == shortName();

  @override
  int get hashCode => shortName().hashCode;
}
