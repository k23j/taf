import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: SprintParticipantTile(),
        ),
      ),
    );
  }
}

class SprintParticipantTile extends StatelessWidget {
  const SprintParticipantTile({super.key});

  void endLap() {}

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).colorScheme.surface,
        child: Padding(
            padding: EdgeInsets.all(8),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Row(children: [
                CircleAvatar(child: Text('1')),
                SizedBox(width: 8),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('CB-OR Passos'),
                  Text('15.0189.62'),
                ]),
                Spacer(),
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Text('Volta 1/6'),
                  Text('2:15'),
                ]),
                SizedBox(width: 8),
                Icon(Icons.remove),
                SizedBox(width: 8),
                IconButton.filledTonal(
                  icon: Icon(Icons.flag),
                  onPressed: endLap,
                ),
              ]),
              SizedBox(height: 8),
              LapTimeGroup(),
            ])));
  }
}

class LapTimeGroup extends StatelessWidget {
  const LapTimeGroup({super.key});

  List<Widget> get lapTimeList {
    return List.generate(
        6 + (6 - 1),
        (index) => (index % 2 == 0)
            ? Expanded(
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                Text('Volta1', style: TextStyle().copyWith(fontSize: 10)),
                Row(children: [
                  Icon(Icons.remove, size: 10),
                  SizedBox(width: 4),
                  Text('2:15', style: TextStyle().copyWith(fontSize: 10))
                ])
              ]))
            : Text(
                '|') //Divider(color: Colors.white,thickness: 2,)//Container(width: 4, color: Colors.white),
        );

    /*
    for (int id = 1; id < (6 - 1) * 2; id += 2) {
      tempList.insert(id, Container(width: 4, color: Colors.white));
    }
*/
    //Divider(color: Colors.white,thickness: 2,)

    //print(tempList);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.all(Radius.circular(6))),
        child: Padding(
            padding: EdgeInsets.all(4),
            child: Row(mainAxisSize: MainAxisSize.max, children: lapTimeList)));
  }
}

class LapTime extends StatelessWidget {
  const LapTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Volta1', style: TextStyle().copyWith(fontSize: 10)),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('2:15', style: TextStyle().copyWith(fontSize: 10)),
            SizedBox(width: 4),
            Icon(Icons.remove, size: 10),
          ])
        ]);
  }
}

class LapTime2 extends StatelessWidget {
  const LapTime2({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
            padding: EdgeInsets.all(4),
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Text('Volta1', style: TextStyle().copyWith(fontSize: 10)),
              Row(children: [
                Icon(Icons.remove, size: 10),
                SizedBox(width: 4),
                Text('2:15', style: TextStyle().copyWith(fontSize: 10))
              ])
            ])));
  }
}
