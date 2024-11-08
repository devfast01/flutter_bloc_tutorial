
import 'package:flutter_block_tutorials/main.dart';

Stream<int> boatStream() async* {
  for (int i = 1; i <= 10; i++) {
    greenLog("SENT boat no. $i");
    await Future.delayed(const Duration(seconds: 2));
    yield i;
  }
}

void main(List<String> args) async {
  Stream<int> stream = boatStream();

  stream.listen((receivedData) {
    greenLog("RECEIVED boat no. $receivedData");
  });
}