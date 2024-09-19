String formatDurationDetailed(Duration duration) {
  int minutes = duration.inMinutes;
  int seconds = duration.inSeconds % 60;
  int milliseconds = duration.inMilliseconds % 1000 ~/ 10;

  return '${_twoDigits(minutes)}:${_twoDigits(seconds)}.${_threeDigits(milliseconds)}';
}

String formatDuration(Duration duration) {
  final minutes = _twoDigits(duration.inMinutes.remainder(60));
  final seconds = _twoDigits(duration.inSeconds.remainder(60));

  return "$minutes:$seconds";
}

String formatDurationLabeled(Duration? duration) {
  if (duration == null) {
    return '-';
  }

  final minutes = duration.inMinutes;
  final seconds = duration.inSeconds.remainder(60);
  final milliseconds =
      (duration.inMilliseconds % 1000) ~/ 1; // Extract milliseconds

  // Format milliseconds to always have up to 3 digits
  final formattedMilliseconds =
      milliseconds.toString().padLeft(3, '0').substring(0, 3);

  return "${minutes}m ${seconds}s ${formattedMilliseconds}ms";
}

String _twoDigits(int number) => number.toString().padLeft(2, '0');
String _threeDigits(int number) => number.toString().padLeft(3, '0');
