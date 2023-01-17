Stream<int> getNumbers() {
  return Stream.fromIterable([1, 2, 3, 4, 5, 6, 7, 8, 9, 10]);
}

void main(List<String> args) {
  // getNumbers().where((number) {
  //   return number % 2 == 0;
  // }).listen((event) {
  //   print(event);
  // });

  getNumbers()
      .where((number) {
        return number % 2 == 0;
      })
      .map((number) => number * 10)
      .map((number) => number * 10)
      .listen((event) {
        print(event);
      });

  Future<int> totalFuture = getNumbers().fold(0, ((previous, element) {
    return previous + element;
  }));

  Future<int> totalFutureReduce = getNumbers().reduce((previous, element) {
    return previous + element;
  });

  totalFuture.then((value) {
    print("Total data : $value");
  }).catchError((error) {
    print("Error data : ${error.message}");
  });

  totalFutureReduce.then((value) {
    print("Data hasil reduce total $value");
  }).catchError((onError) {
    print("Data ${onError.message}");
  });

  print("Done");
}
