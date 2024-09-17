import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taf/participant/data/participant_group_list.dart';
import 'package:taf/participant/models/participant_group.dart';
import 'package:taf/participant/view/new_participant_group_screen.dart';

class GroupSelectionWidget extends StatefulWidget {
  const GroupSelectionWidget({required this.onGroupSelec, super.key});

  final Function(ParticipantGroup? group) onGroupSelec;

  @override
  State<GroupSelectionWidget> createState() => _GroupSelectionWidgetState();
}

class _GroupSelectionWidgetState extends State<GroupSelectionWidget> {
  //final TextEditingController controller = TextEditingController(text: 'test');
  ParticipantGroup? selectedGroup;

  Future<ParticipantGroup?> addNewGroup() async {
    ParticipantGroup? newGroup =
        await Navigator.of(context).push<ParticipantGroup>(MaterialPageRoute(
      builder: (context) => const NewParticipantGroupScreen(),
    ));

    if (newGroup != null) {
      setState(() {
        selectedGroup = newGroup;
      });
    }

    return newGroup;
  }

  void onChanged(ParticipantGroup? selectedGroup) async {
    if (selectedGroup == null) {
      addNewGroup();

      return;
    }

    setState(() {
      this.selectedGroup = selectedGroup;
    });
  }

  // @override
  // void dispose() {
  //   selectedGroup =
  //       Provider.of<GroupNotifier>(context, listen: false).firstGroup;
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<GroupNotifier>(
      builder: (context, value, child) {
        List<ParticipantGroup> groupList = value.groupList;
        return groupList.isEmpty
            ? TextButton(
                onPressed: addNewGroup, child: const Text('Criar nova turma'))
            : DropdownButton<ParticipantGroup?>(
                //controller: controller,

                value: (selectedGroup == null) ? value.firstGroup : selectedGroup,
                onChanged: onChanged,
                //initialSelection: groupList.isEmpty ? null : groupList[0],
                items: [
                    ...groupList.map(
                      (group) => DropdownMenuItem<ParticipantGroup?>(
                          child: Text(group.groupName), value: group),
                    ),
                    DropdownMenuItem<ParticipantGroup?>(
                      value: null,
                      child: IgnorePointer(
                        ignoring: true,
                        child: TextButton.icon(
                            style: const ButtonStyle(
                                foregroundColor:
                                    WidgetStatePropertyAll(Colors.green)),
                            icon: const Icon(Icons.add),
                            onPressed: null,
                            label: const Text('Criar nova Turma')),
                      ),
                    )
                  ]);
      },
    );
  }
}

// (context) {
//       return DropdownMenu(
//           controller: controller,
//           initialSelection: groupList.isEmpty ? null : groupList[0],
//           dropdownMenuEntries: groupList
//               .map((group) => DropdownMenuEntry<ParticipantGroup>(
//                   value: group, label: group.groupName))
//               .toList());
//     }