import 'package:taf/participant/models/rank.dart';

import 'package:taf/participant/models/gender.dart';

class Participant {
  final String name;
  final Gender gender;
  final Rank rank;
  final String nip;

  const Participant(
      {required this.name,
      required this.gender,
      required this.rank,
      required this.nip});

  @override
  String toString() {
    return '${rank.abbr} - $name';
  }

  @override
  bool operator ==(Object other) {
    if ((other is! Participant)) {
      return false;
    }

    return nip == other.nip;
  }

  @override
  int get hashCode => nip.hashCode;
}
