import 'dart:io';
import 'dart:isolate';

Future<void> sayHello(String name) async {
  sleep(Duration(seconds: 2));
  print("Hello $name");
  // Nilai print tidak keluar karena bukan di isolate utama
  Isolate.exit();
}

void main() {
  Isolate.spawn(sayHello, "Eko");
  print("Done");
}
