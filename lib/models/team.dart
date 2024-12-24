class Team {
  final String name;
  final int game1;
  final int game2;
  final int game3;
  final int game4;
  final int total;
  final List<dynamic> members;

  Team({
    required this.name,
    required this.game1,
    required this.game2,
    required this.game3,
    required this.game4,
    required this.total,
    required this.members,
  });

  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      name: json['name'],
      game1: json['game1'],
      game2: json['game2'],
      game3: json['game3'],
      game4: json['game4'],
      total: json['total'],
      members: json['members'],
    );
  }
}
