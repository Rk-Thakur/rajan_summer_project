class registeredteam {
  late String team_name;
  late String manager_name;
  late String tournament_name;
  late String registerteam_id;
  late String images;
  late String playername;

  registeredteam(
      {required this.team_name,
      required this.manager_name,
      required this.tournament_name,
      required this.images,
      required this.playername});

  factory registeredteam.fromJson(Map<String, dynamic> json) {
    return registeredteam(
        team_name: json['team_name'],
        manager_name: json['manager_name'],
        tournament_name: json['tournament_name'],
        playername: json['player_name'],
        images: json['images']);
  }
}
