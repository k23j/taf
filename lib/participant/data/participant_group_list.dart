import 'package:flutter/material.dart';
import 'package:taf/participant/models/participant_group.dart';

//List<ParticipantGroup> groupList = [];

class GroupNotifier extends ChangeNotifier {
  final List<ParticipantGroup> _groupList = []; // Private list

  // Provide read-only access to the group list
  List<ParticipantGroup> get groupList => List.unmodifiable(_groupList);
  ParticipantGroup? get firstGroup {
    if (_groupList.isEmpty) {
      return null;
    }

    return _groupList[0];
  }

  void addGroup(ParticipantGroup group) {
    _groupList.add(group);
    notifyListeners();
  }

  void removeGroup(ParticipantGroup group) {
    _groupList.remove(group);
    notifyListeners();
  }
}
