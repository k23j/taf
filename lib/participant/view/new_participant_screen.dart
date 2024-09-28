import 'package:flutter/material.dart';
import 'package:taf/participant/models/gender.dart';
import 'package:taf/participant/models/participant.dart';
import 'package:taf/participant/models/rank.dart';
import 'package:taf/participant/view/gender_switch.dart';
import 'package:taf/participant/view/rank_dropdown.dart';

class NewParticipantScreen extends StatefulWidget {
  const NewParticipantScreen({super.key});

  @override
  State<NewParticipantScreen> createState() => _NewParticipantScreenState();
}

class _NewParticipantScreenState extends State<NewParticipantScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController =
      TextEditingController(text: 'Participante ');

  Gender selectedGender = Gender.m;
  void onGenderChange(Gender newGender) {
    setState(() {
      selectedGender = newGender;
    });
  }

  Rank? selectedRank;
  void onRankSelected(Rank? rank) {
    // if (rank == null) {
    //   return;
    // }

    selectedRank = rank;
  }

  void cancel() {
    Navigator.of(context).pop(null);
  }

  void submit() {
    if (formKey.currentState == null) {
      return;
    }
    if (formKey.currentState!.validate() && selectedRank != null) {
      Navigator.of(context).pop<Participant>(
        Participant(
          name: nameController.text,
          gender: selectedGender,
          rank: selectedRank!,
        ),
      );
    }
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
        title: const Text('Novo Participante'),
        actions: [
          IconButton(onPressed: cancel, icon: const Icon(Icons.close)),
          IconButton(onPressed: submit, icon: const Icon(Icons.check)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextFormField(
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
                    ),
                    const SizedBox(width: 16,),
                    RankDrowpdown(onSelected: onRankSelected),
                  ],
                ),
                GenderSwitch(
                    value: selectedGender, onGenderChange: onGenderChange),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
