import 'dart:async';

void main(List<String> args) {
  Timer(Duration(seconds: 3), () {
    print("Hello dari timer");
  });

  Timer.periodic(Duration(seconds: 1), (timer) {
    print("Timer ke ${timer.tick}");

    if (timer.tick >= 5) {
      timer.cancel();
    }
  });

  print("Selesai timer");
}
