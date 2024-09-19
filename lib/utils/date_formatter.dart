String formatDate(DateTime? dateTime) {
  if (dateTime == null) {
    return 'Em Andamento';
  }

  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final hours = twoDigits(dateTime.hour);
  final minutes = twoDigits(dateTime.minute);
  final seconds = twoDigits(dateTime.second);
  return "$hours:$minutes:$seconds";
}
