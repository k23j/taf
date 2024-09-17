import 'participant.dart';

class ParticipantGroup {
  final String groupName;
  List<Participant> subjectList;

  ParticipantGroup({required this.groupName, required this.subjectList});

  int get length => subjectList.length;
}
