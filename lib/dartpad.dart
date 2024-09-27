import 'package:flutter/material.dart';

enum Gender {
  m(gender: 'Masculino', abbr: 'M'),
  f(gender: 'Feminino', abbr: 'F');

  const Gender({required this.gender, required this.abbr})
      : isMasculine = abbr == 'M';

  final String gender;
  final String abbr;
  final bool isMasculine; // => abbr == 'M';

  static Gender fromString(String value) {
    switch (value) {
      case 'M':
        return Gender.m;
      case 'F':
        return Gender.f;
      default:
        throw ArgumentError('No gender for string: $value.');
    }
  }

  static Gender fromBool(bool value) {
    return value ? Gender.m : Gender.f;
  }

  @override
  String toString() {
    return abbr;
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Center(
            child: MyFormWidget(),
          ),
        ));
  }
}

class MyFormWidget extends StatefulWidget {
  const MyFormWidget({super.key});

  @override
  State<MyFormWidget> createState() => _MyFormWidgetState();
}

class _MyFormWidgetState extends State<MyFormWidget> {
  Gender currentGender = Gender.m;
  Rank currentRank = Rank.mn;

  void onGenderChange(Gender value) {
    setState(() {
      currentGender = value;
    });
  }
  
  void onRankSelected(Rank? rank) {
    if (rank == null) return;
    
    setState(() {
      currentRank = rank;
    });
    
    print(currentRank.name);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GenderSwitch(value: currentGender, onGenderChange: onGenderChange),
          RankDrowpdown(onSelected: onRankSelected,),
        ]);
  }
}

class GenderSwitch extends StatelessWidget {
  final Gender value;
  final Function(Gender gender) onGenderChange;

  const GenderSwitch(
      {required this.value, required this.onGenderChange, super.key});

  Widget build(BuildContext context) {
    return SizedBox(
        width: 164,
        child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Gênero: ${value.gender}'),
              Checkbox.adaptive(
                  value: value.isMasculine,
                  onChanged: (b) {
                    if (b == null) {
                      return;
                    }
                    onGenderChange(Gender.fromBool(b));
                  })
            ]));
  }
}

enum Rank {
  mn(name: "Marinheiro", abbr: "Mn", ant: 11),
  cb(name: "Cabo", abbr: "Cb", ant: 21),
  sg(name: "Sargento", abbr: "Sg", ant: 30),
  sg_3(name: "3º Sargento", abbr: "3Sg", ant: 31),
  sg_2(name: "2º Sargento", abbr: "2Sg", ant: 32),
  sg_1(name: "1º Sargento", abbr: "1Sg", ant: 33),
  so(name: "Suboficial", abbr: "SO", ant: 41, tags: ['Sub']),
  t(name: "Tenente", abbr: "Ten", ant: 50),
  t_2(name: "2º Tenente", abbr: "2T", ant: 51),
  t_1(name: "1º Tenente", abbr: "1T", ant: 52),
  ct(name: "Capitão-Tenente", abbr: "CT", ant: 52),
  cmd(name: "Comandante", abbr: "Com", ant: 60),
  cc(name: "Capitão-de-Corveta", abbr: "CC", ant: 61),
  cf(name: "Capitão-de-Fragata", abbr: "CF", ant: 62),
  cmg(name: "Capitão-de-Mar-e-Guerra", abbr: "CMG", ant: 63),
  alt(name: "Almirante", abbr: "Alt", ant: 70);

  final List<String> tags;
  final String name;
  final String abbr;
  final int ant;

  const Rank(
      {this.tags = const [],
      required this.name,
      required this.abbr,
      required this.ant})
      : type = ant >= 50 ? RankType.Of : RankType.Pr,
        isGeneric = ant % 10 == 0,
        isSpecific = ant % 10 != 0;

  final RankType type;
  final bool isGeneric;
  final bool isSpecific;

  //TODO: to/fromString
}

enum RankType {
  Of('Oficial', 'Of'),
  Pr('Praça', 'Pr');

  const RankType(this.name, this.abbr);

  final String name;
  final String abbr;
}

class RankDrowpdown extends StatelessWidget {
  final Function(Rank? rank) onSelected;
  
  const RankDrowpdown({required this.onSelected, super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownMenu<Rank>(
      initialSelection: Rank.mn,
      onSelected: onSelected,
      dropdownMenuEntries: Rank.values
          .where((rank) => rank.isSpecific)
          .map((rank) => DropdownMenuEntry<Rank>(label: rank.abbr, value: rank))
          .toList(),
    );
  }
}
