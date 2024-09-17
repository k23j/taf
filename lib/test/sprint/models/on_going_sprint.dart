class OnGoingSprint {
  final DateTime beginOn;
  final Duration elapsed = Duration.zero;
  late final DateTime endOn;
  bool onGoing = false;

  OnGoingSprint({required this.beginOn});
}
