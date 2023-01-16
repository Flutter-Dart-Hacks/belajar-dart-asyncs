Future<String> getName() {
  return Future.value("Kucing Makan Tikus");
}

Future<String> panggilHalo(String nama) {
  return Future.delayed(Duration(seconds: 2), () {
    // return Future.value("Halo $nama");
    return Future.error(Exception("Pesan error disini"));
  });
}

void main(List<String> args) {
  getName()
      .then((value) => value.split(" "))
      .then((value) => value.reversed)
      .then((value) {
        return value.map((e) => e.toUpperCase());
      })
      .then((value) => print(value.toList()))
      .catchError((error) {
        print(error);
      });

  panggilHalo("Ikan Koi")
      .then((value) => print(value))
      .catchError((error) => print("Error dengan pesan ${error.message}"))
      .whenComplete(() {
    print("Semua selesai");
  });

  print("Selesai");
}
