import 'package:flutter/material.dart';
import 'package:taf/participant/models/participant.dart';

class ParticipantDetailsScreen extends StatelessWidget {
  final Participant data;

  const ParticipantDetailsScreen(this.data, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${data.rank.abbr} ${data.name}'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Nome: ${data.name}'),
          Text('Post/Grad: ${data.rank.name}'),
          Text('Gênero: ${data.gender.gender}'),
          Text('NIP: ${data.nip}'),
        ],
      ),
    );
  }
}
