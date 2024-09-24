class SprintCourse {
  final int totalLength;
  final int lapCount;

  final int lapLength;

  const SprintCourse._internal({
    required this.totalLength,
    required this.lapCount,
    required this.lapLength,
  });

  factory SprintCourse({required int totalLength, required int lapCount}) {
    final int lapLength = totalLength ~/ lapCount;

    return SprintCourse._internal(
      totalLength: totalLength,
      lapCount: lapCount,
      lapLength: lapLength,
    );
  }
}