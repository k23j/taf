import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taf/fab/fab_data.dart';
import 'package:taf/fab/on_active_mixin.dart';
import 'package:taf/notifier/fab_notifier.dart';
import 'package:taf/participant/models/participant.dart';
import 'package:taf/participant/data/participant_list.dart';
import 'package:taf/participant/view/new_participant_screen.dart';
import 'package:taf/participant/view/participant_list_tile.dart';

class ParticipantScreen extends StatefulWidget {
  const ParticipantScreen({super.key});

  @override
  State<ParticipantScreen> createState() => _ParticipantScreenState();
}

class _ParticipantScreenState extends State<ParticipantScreen>
    with OnActiveMixin {
  late final FABData fabData;

  @override
  void initState() {
    fabData = FABData(icon: Icons.person_add, onPressed: onFabPressed);
    super.initState();
  }

  @override
  void onBecomeActive() {
    context.read<FABNotifier>().setData(fabData);
  }

  void onFabPressed() {
    addParticipant();
  }

  void addParticipant() async {
    Participant? newParticipant =
        await Navigator.of(context).push<Participant?>(MaterialPageRoute(
      builder: (context) => const NewParticipantScreen(),
    ));

    if (newParticipant != null) {
      setState(() {
        participantList.add(newParticipant);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Participantes'),
        actions: [
          IconButton(onPressed: addParticipant, icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
        itemCount: participantList.length,
        itemBuilder: (context, index) =>
            ParticipantListTile(participantList[index]),
      ),
    );
  }
}
