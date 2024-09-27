enum Gender {
  m(gender: 'Masculino', abbr: 'M'),
  f(gender: 'Feminino', abbr: 'F');

  const Gender(
      {required this.gender, required this.abbr}) : isMasculine = abbr == 'M';

  final String gender;
  final String abbr;
  final bool isMasculine;// => abbr == 'M';

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