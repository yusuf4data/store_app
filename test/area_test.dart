import 'package:flutter_test/flutter_test.dart';

void main() {
  late AreaCalculation calculation;
  setUp(() {
    calculation = AreaCalculation();
  });
  group('Area calculation of -', () {
    // test(' squer should be 4 if the width is 2', () {
    //   num areaValue = calculation.area(shapeName: 'squar', width: 2);
    //   expect(areaValue, 4.0000);
    // });
    test(' rectangular should be 6 if the width is 2 and length is 3', () {
      num areaValue =
          calculation.area(shapeName: 'rectangular', width: 2, length: 3);
      expect(areaValue, 6);
    });
    test(' circle should be 22*7 if the ridius is 7 ', () {
      num areaValue = calculation.area(shapeName: 'circle', redius: 7);
      expect(areaValue, 22);
    });
  });
}

class AreaCalculation {
  num area(
      {required String shapeName, num? width, num? length, double? redius}) {
 

    
    

    if (shapeName == 'rectangular') {
      final area = width! * length!;
      return area;
    }
    if (shapeName == 'circle') {
      final area = 22 / 7 * redius!;
      return area;
    }
    return 0;
  }
}


class Rec<Shape> {

}





