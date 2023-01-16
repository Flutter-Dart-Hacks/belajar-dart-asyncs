import 'dart:async';

Stream<String> getStream() {
  return Stream.periodic(Duration(seconds: 2), (i) {
    if (i % 2 == 0) {
      return "$i : Genap";
    } else {
      return "$i : Ganjil";
    }
  });
}

void main(List<String> args) {
  Stream<String> flowstream = getStream();
  StreamSubscription<String> listenStream = flowstream.listen((event) {
    print(event); // Digantikan oleh onData
  });

  // Tidak bisa di subscribe 2x
  // StreamSubscription<String> listenStream2 = flowstream.listen((event) {
  //   print(event);
  // });

  // Callback di on data menggantikan di dalam fungsi listen
  listenStream.onData((data) {
    print("On data : $data");
  });

  listenStream.onError((error) {
    print("Fungsi error");
  });

  listenStream.onDone(() {
    print("Selesai stream");
  });

  print("Selesai Stream");
}
