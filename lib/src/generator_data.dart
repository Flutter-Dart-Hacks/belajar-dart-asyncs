import 'dart:async';

Iterable<int> syncNumber() sync* {
  for (var i = 0; i < 10; i++) {
    yield i;
  }
}

Stream<int> asyncNumber() async* {
  for (var i = 0; i < 10; i++) {
    yield i;
  }
}

Stream<int> doubleNumber(int number) async* {
  yield number;
  yield number;
}

Stream<int> asyncNumberYieldStar() async* {
  for (int i = 0; i < 10; i++) {
    // mengirim stream ke dalam fungsi double number generator
    // yield doubleNumber(i);
    yield* doubleNumber(i);
  }
}

// MENGGUNAKAN FUNGSI GENERATOR YIELD DAN SYNC* ASYNC*
void main(List<String> args) {
  // syncNumber().forEach((element) {
  //   print(element);
  // });

  // asyncNumber().listen((event) {
  //   print("Async generator : $event");
  // });

  // doubleNumber(10).listen((event) {
  //   print(event);
  // });

  asyncNumberYieldStar().listen((event) {
    print(event);
  });

  print("Selesai");
}
