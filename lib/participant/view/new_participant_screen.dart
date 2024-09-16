import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:taf/participant/models/participant.dart';

class NewParticipantScreen extends StatefulWidget {
  const NewParticipantScreen({super.key});

  @override
  State<NewParticipantScreen> createState() => _NewParticipantScreenState();
}

class _NewParticipantScreenState extends State<NewParticipantScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController(text: 'Participante ');

  void cancel() {
    Navigator.of(context).pop(null);
  }

  void submit() {
    if (formKey.currentState == null) {
      return;
    }
    if (formKey.currentState!.validate()) {
      Navigator.of(context).pop<Participant>(Participant(nameController.text));
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
