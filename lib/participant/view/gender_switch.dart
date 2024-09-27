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
