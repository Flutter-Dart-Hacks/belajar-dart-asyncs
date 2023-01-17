Stream<int> getNumberStream() {
  return Stream.fromIterable([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
}

void main(List<String> args) {
  // Membuat konversi ke bentuk future
  Stream<int> streamNumber = getNumberStream().asyncMap((event) {
    return Future.delayed(Duration(seconds: 2), () {
      return event;
    });
  });

  // streamNumber.listen((event) {
  //   print(event);
  // }).onDone(() {
  //   print("Loop selesai");
  // });

  Stream<int> broadcastStreams = streamNumber.asBroadcastStream();

  broadcastStreams.listen((event) {
    print("Listen pertama : $event");
  }).onDone(() {
    print("Listen pertama selesai");
  });

  broadcastStreams.listen((event) {
    print("Listen kedua : $event");
  }).onDone(() {
    print("Listen kedua selesai");
  });
}
