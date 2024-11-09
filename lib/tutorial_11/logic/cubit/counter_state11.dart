// ignore: must_be_immutable
import 'dart:convert';

class CounterState {
  int counterValue;
  bool wasIncremented;

  // ? counterValue state-ni mobile storage-da saklamak ucin asakdaky yaly gordusde json funsiayalar yazyldy
 // ? hydrated_bloc library value statleri mobile storage-da saklayar. 
  CounterState({
    required this.counterValue,
    required this.wasIncremented,
  });

  Map<String, dynamic> toMap() {
    return {
      'counterValue': counterValue,
      'wasIncremented': wasIncremented,
    };
  }

  factory CounterState.fromMap(Map<String, dynamic> map) {
    return CounterState(
      counterValue: map['counterValue'],
      wasIncremented: map['wasIncremented'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CounterState.fromJson(String source) =>
      CounterState.fromMap(json.decode(source));
}
