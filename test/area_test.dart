import 'package:flutter_test/flutter_test.dart';

void main() {
  late Calculation calculation;
  setUp(() {
    calculation = Calculation();
  });
  group('Area of -', () {
    test(' squer should be 4 if the width is 2', () {
      num areaValue = calculation.area(shape: 'squar', width: 2);
      expect(areaValue, 4);
    });
    test(' rectangular should be 6 if the width is 2 and length is 3', () {
      num areaValue =
          calculation.area(shape: 'rectangular', width: 2, length: 3);
      expect(areaValue, 6);
    });
    test(' circle should be 22*7 if the ridius is 7 ', () {
      num areaValue = calculation.area(shape: 'circle', redius: 7);
      expect(areaValue, 22);
    });
  });
}

class Calculation {
  num area({required String shape, num? width, num? length, num? redius}) {
    if (shape == 'squar') {
      Squar squar = Squar(shapeName: 'squar', width: 2);
      final area = squar.methodCalculation();
      return area;
    }
    if (shape == 'rectangular') {
      final area = width! * length!;
      return area;
    }
    if (shape == 'circle') {
      final area = 22 / 7 * redius!;
      return area;
    }
    return 0;
  }
}

abstract class Shape<T> {
  String shapeName;
  Shape({
    required this.shapeName,
  });
  num methodCalculation();
}

class Squar extends Shape {
  num width;

  Squar({required super.shapeName, required this.width});
  @override
  num methodCalculation() {
    return width * width;
  }
}
