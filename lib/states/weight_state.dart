import 'package:flutter/cupertino.dart';
import 'package:flutterstatemanagment/models/weight.dart';

class WeightState with ChangeNotifier {

  List<Weight> _weights = [
    Weight(value: 65, time: DateTime.utc(2020, 06, 07)),
    Weight(value: 91, time: DateTime.utc(2020, 11, 03)),
    Weight(value: 39, time: DateTime.utc(2020, 09, 16)),
    Weight(value: 75, time: DateTime.utc(2020, 04, 23)),
    Weight(value: 47, time: DateTime.utc(2020, 12, 10))
  ];

  List<Weight> get weights => _weights;

  add(Weight weight){
    _weights.insert(0, weight);
    notifyListeners();
  }

}
