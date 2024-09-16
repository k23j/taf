import 'package:flutter/material.dart';
import 'package:taf/participant/models/participant_group.dart';
import 'package:taf/participant/models/participant.dart';
import 'package:taf/participant/data/participant_list.dart';

// class NewParticipantGroupScreen extends StatelessWidget {
//   const NewParticipantGroupScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(appBar: AppBar(title: Text('Nova Turma'),),);
//   }
// }

class NewParticipantGroupScreen extends StatefulWidget {
  const NewParticipantGroupScreen({super.key});

  @override
  State<NewParticipantGroupScreen> createState() =>
      _NewParticipantScreenState();
}

class _NewParticipantScreenState extends State<NewParticipantGroupScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController =
      TextEditingController(text: 'Turma ');

  List<Participant> selected = [];

  List<Participant> get unselected => participantList
      .where((element) => !(selected.contains(element)))
      .toList();

  void cancel() {
    Navigator.of(context).pop(null);
  }

  void submit() {
    if (formKey.currentState == null) {
      return;
    }
    if (formKey.currentState!.validate() && selected.isNotEmpty) {
      Navigator.of(context).pop<ParticipantGroup>(
          ParticipantGroup(groupName: nameController.text, subjectList: selected));
    }
  }

  void onChangeUserState(Participant participant, bool state) {
    setState(() {
      if (state) {
        selected.add(participant);
      } else {
        selected.remove(participant);
      }
    });
  }

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova Turma'),
        actions: [
          IconButton(onPressed: cancel, icon: const Icon(Icons.close)),
          IconButton(onPressed: submit, icon: const Icon(Icons.check)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              TextFormField(
                controller: nameController,
                validator: (value) {
                  //TODO: Pass this validator to a static method on the participant class
                  if (value == null || value.trim().isEmpty) {
                    return 'Digite um nome!';
                  }
                  if (value.length < 3) {
                    return 'Minimo de 3 caracteres!';
                  }
                  return null;
                },
                //initialValue: 'Participante',
                decoration: const InputDecoration(label: Text('Nome')),
              ),
              SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: selected.length,
                        itemBuilder: (context, index) =>
                            ParticipantSelectionItem(
                          data: selected[index],
                          bSelected: true,
                          onChange: onChangeUserState,
                        ),
                      ),
                      if (selected.isNotEmpty) const Divider(),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: unselected.length,
                        itemBuilder: (context, index) =>
                            ParticipantSelectionItem(
                          data: unselected[index],
                          bSelected: false,
                          onChange: onChangeUserState,
                        ),
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ParticipantSelectionItem extends StatelessWidget {
  final Participant data;
  final bool bSelected;
  final Function(Participant participant, bool state) onChange;

  const ParticipantSelectionItem(
      {required this.data,
      required this.bSelected,
      required this.onChange,
      super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(data.name),
      trailing: IconButton(
          onPressed: () => onChange(data, !bSelected),
          icon: bSelected ?
            const Icon(Icons.close, color: Colors.red,) :
            const Icon(Icons.add, color:  Colors.green,)),
    );
  }
}
