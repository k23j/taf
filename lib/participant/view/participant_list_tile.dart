import 'package:flutter/material.dart';
import 'package:taf/participant/models/participant.dart';
import 'package:taf/participant/view/participant_details_screen.dart';

class ParticipantListTile extends StatelessWidget {
  final Participant data;

  const ParticipantListTile(this.data, {super.key});

  void openDetails(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => ParticipantDetailsScreen(data),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => openDetails(context),
        child: Card(
            child: ListTile(
          title: Text(data.name),
        )));
  }
}
