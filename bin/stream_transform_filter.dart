Stream<int> numbers() {
  return Stream.fromIterable([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
}

Stream<int> getNumbers() {
  return Stream.fromIterable([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
}

void main() {
  numbers().where((number) => number % 2 == 0).take(2).listen((event) {
    print(event);
  });

  getNumbers().where((number) {
    return number % 2 == 0;
  }).listen((event) {
    print(event);
  });

  print("Done");
}
