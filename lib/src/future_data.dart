Future<void> ketikHeloAsync() {
  return Future.delayed(Duration(seconds: 3), () {
    print("Tes fungsi future");
  });
}

Future<String> fungsiFutureMethod(String namaData) async {
  return Future.delayed(Duration(seconds: 2), () {
    return "Halo $namaData";
  });
}

Future<String> fungsiFutureMethodError(String namaData) async {
  return Future.delayed(Duration(seconds: 2), () {
    //return "Halo $namaData";
    throw Error();
  });
}

void main(List<String> args) {
  // ketikHeloAsync();
  // print("Selesai");
  // Selesai
  // Tes fungsi future

  fungsiFutureMethod("Kucing").then((value) {
    print(value);
  }).whenComplete(() {
    print("Fungsi future sukses selesai");
  });

  fungsiFutureMethodError("Kucing eror")
      // .onError((error, stackTrace) {
      //   print(stackTrace);
      //   print(error);
      //   return "Fallback";
      // })
      .then((value) {
    print("Hasil koreksi error : $value");
  }).catchError((error) {
    print(error);
    print("Error dengan pesan ${error.message}");
  });

  print("Selesai");
}
