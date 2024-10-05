import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taf/fab/fab_data.dart';
import 'package:taf/fab/on_active_mixin.dart';
import 'package:taf/notifier/fab_notifier.dart';
import 'package:taf/participant/data/participant_group_list.dart';
import 'package:taf/participant/models/participant_group.dart';
import 'package:taf/participant/view/new_participant_group_screen.dart';
import 'package:taf/participant/view/participant_group_list_tile.dart';

class ParticipantGroupScreen extends StatefulWidget {
  const ParticipantGroupScreen({super.key});

  @override
  State<ParticipantGroupScreen> createState() => _ParticipantGroupScreenState();
}

class _ParticipantGroupScreenState extends State<ParticipantGroupScreen>
    with OnActiveMixin {
  late final FABData fabData;

  @override
  void initState() {
    fabData = FABData(icon: Icons.group_add, onPressed: onFabPressed);
    super.initState();
  }

  void onFabPressed() {
    addGroup();
  }

  @override
  void onBecomeActive() {
    context.read<FABNotifier>().setData(fabData);
  }

  void addGroup() async {
    await Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const NewParticipantGroupScreen(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Turmas'),
        actions: [IconButton(onPressed: addGroup, icon: const Icon(Icons.add))],
      ),
      body: Consumer<GroupNotifier>(
        builder: (context, value, child) {
          List<ParticipantGroup> groupList = value.groupList;
          return ListView.builder(
            itemCount: groupList.length,
            itemBuilder: (context, index) =>
                ParticipantGroupListTile(groupList[index]),
          );
        },
      ),
    );
  }
}
