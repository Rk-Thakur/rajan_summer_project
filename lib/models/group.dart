class group {
  late String group_image;
  late String group_name;
  group({required this.group_image, required this.group_name});
  factory group.fromJson(Map<String, dynamic> json) {
    return group(
        group_image: json['group_image'], group_name: json['group_name']);
  }
}
