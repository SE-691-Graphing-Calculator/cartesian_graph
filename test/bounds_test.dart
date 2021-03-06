import 'package:cartesian_graph/coordinates.dart';
import 'package:cartesian_graph/graph_bounds.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Input validation', () {
    test('should mandate larger max x than min x', () {
      expect(() => GraphBounds(2, 1, -2, 2), throwsAssertionError);
    });

    test('should mandate larger max y than min y', () {
      expect(() => GraphBounds(0, 1, 2, 1), throwsAssertionError);
    });
  });

  group('Checks if contains coordinates',(){
    test('when coordinates are contained',(){
      expect(GraphBounds(-1,1,-1,1).isWithin(Coordinates(0,0)), true);
    });

    test('when coordinates are contained on boundary',(){
      expect(GraphBounds(-1,1,-1,1).isWithin(Coordinates(1,1)), true);
    });

    test('when coordinates are outside x',(){
      expect(GraphBounds(-1,1,-1,1).isWithin(Coordinates(2,1)), false);
    });

    test('when coordinates are outside y',(){
      expect(GraphBounds(-1,1,-1,1).isWithin(Coordinates(1,2)), false);
    });
  });

  group('Checks if contains values',(){
    group('x values',(){
      test('when x value is within bounds',(){
        expect(GraphBounds(-1,1,-1,1).isXWithin(0), true);
      });

      test('when x value is beneath bounds',(){
        expect(GraphBounds(-1,1,-1,1).isXWithin(-2), false);
      });

      test('when x value above bounds',(){
        expect(GraphBounds(-1,1,-1,1).isXWithin(2), false);
      });
    });
    group('y values',(){
      test('when y value is within bounds',(){
        expect(GraphBounds(-1,1,-1,1).isYWithin(0), true);
      });

      test('when y value is beneath bounds',(){
        expect(GraphBounds(-1,1,-1,1).isYWithin(-2), false);
      });

      test('when y value above bounds',(){
        expect(GraphBounds(-1,1,-1,1).isYWithin(2), false);
      });
    });
  });
}