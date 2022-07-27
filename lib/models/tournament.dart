class tournaments {
  late String tournament_image;
  late String organizer_name;
  late String prize_description;
  late String rules_regulation;
  late String tournament_id;
  late String tournament_information;
  late String tournament_name;

  tournaments(
      {required this.tournament_image,
      required this.organizer_name,
      required this.prize_description,
      required this.rules_regulation,
      required this.tournament_id,
      required this.tournament_information,
      required this.tournament_name});

  factory tournaments.fromJson(Map<String, dynamic> json) {
    return tournaments(
        tournament_image: json['image'],
        organizer_name: json['organizer_name'],
        prize_description: json['prize_description'],
        rules_regulation: json['rules_regulation'],
        tournament_id: json['tournament_id'],
        tournament_information: json['tournament_information'],
        tournament_name: json['tournament_name']);
  }
}
