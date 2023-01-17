import 'dart:async';

Stream<String> getNames() {
  return Stream.fromIterable(["Kata1", "Kata2", "Kata3"]);
}

Future<String> getFullName() async {
  String name = "";
  await for (String element in getNames()) {
    name += "$element ";
  }

  return name.trim();
}

void main(List<String> args) {
  getFullName().then((value) => print(value));
  print("Selesai");
}
