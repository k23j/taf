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