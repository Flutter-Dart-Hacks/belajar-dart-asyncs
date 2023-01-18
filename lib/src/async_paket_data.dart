import 'dart:async';

import 'package:async/async.dart';

Future<String> getData() {
  return Future.delayed(Duration(seconds: 2), () {
    return "Get data future";
  });
}

void main(List<String> args) async {
  final asyncCaches = AsyncCache<String>(Duration(seconds: 10));

  // Future<String> result = asyncCaches.fetch(() => getData());
  String result = await asyncCaches.fetch(() => getData());
  // var stringHasil = await result;
  print(result);

  String resultDua = await asyncCaches.fetch(() => getData());
  print(resultDua);

  // hasil kedua langsung keluar
}
