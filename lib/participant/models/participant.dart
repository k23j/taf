import 'package:taf/participant/models/rank.dart';

import 'package:taf/participant/models/gender.dart';

class Participant {
  final String name;
  final Gender gender;
  final Rank rank;

  const Participant({required this.name, required this.gender, required this.rank});
}
