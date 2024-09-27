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
  
  const Rank({
    this.tags = const [],
    required this.name,
    required this.abbr,
    required this.ant
    }) :  type = ant >= 50 ? RankType.Of : RankType.Pr,
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


  const RankType(this.name,this.abbr);

  final String name;
  final String abbr;
}