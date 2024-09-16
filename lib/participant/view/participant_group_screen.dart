import 'package:flutter/material.dart';
import 'package:taf/participant/data/participant_group_list.dart';
import 'package:taf/participant/models/participant_group.dart';
import 'package:taf/participant/view/new_participant_group_screen.dart';
import 'package:taf/participant/view/participant_group_list_tile.dart';

class ParticipantGroupScreen extends StatefulWidget {
  const ParticipantGroupScreen({super.key});

  @override
  State<ParticipantGroupScreen> createState() => _ParticipantScreenState();
}

class _ParticipantScreenState extends State<ParticipantGroupScreen> {
  void addGroup() async {
    ParticipantGroup? newParticipant = await Navigator.of(context).push<ParticipantGroup?>(MaterialPageRoute(builder: (context) => const NewParticipantGroupScreen(),));
  
    if (newParticipant != null) {
      setState(() {
        groupList.add(newParticipant);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Turmas'),
        actions: [
          IconButton(onPressed: addGroup, icon: const Icon(Icons.add))
        ],
      ),
      body: ListView.builder(
        itemCount: groupList.length,
        itemBuilder: (context, index) =>
            ParticipantGroupListTile(groupList[index]),
      ),
    );
  }
}