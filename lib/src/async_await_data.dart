import 'dart:async';

// Tes future paralel
Future<List<String>> heloKataWait(String nama) async {
  return Future.wait([
    Future.delayed(Duration(seconds: 2), () {
      return 'future satu';
    }),
    Future.delayed(Duration(seconds: 2), () {
      return 'future dua';
    }),
    Future.delayed(Duration(seconds: 2), () {
      return 'future tiga';
    })
  ]);
}

Future<String> ketikHelo(String nama) async {
  return 'Halo kata $nama';
}

void tesParalel() async {
  List<String> values = await heloKataWait("nama kucing");
  print(values);
}

Future<String> firstName() async {
  return "Eko";
}

Future<String> lastName() async {
  return "Khannedy";
}

Future<String> sayHello(String name) async {
  return "Hello $name";
}

void futureProblems() {
  firstName().then((firstName) {
    return lastName().then((lastName) {
      var fullName = "$firstName $lastName";
      return sayHello(fullName);
    });
  }).then((value) => print(value));
}

Future<String> sayHelloError(String name) async {
  // return "Hello $name";
  throw Exception("Ups");
}

void solusiFutureProblems() async {
  var first = await firstName();
  var kedua = await lastName();
  var hello = await sayHello("Await $first $kedua");

  try {
    var helloerror = await sayHelloError("Error");
  } catch (err) {
    print(err);
  }
  print(hello);
}

void main(List<String> args) {
  tesParalel();

  ketikHelo("kucing tikus").then((value) => print(value));

  futureProblems();

  solusiFutureProblems();

  print("Selesai");
}
