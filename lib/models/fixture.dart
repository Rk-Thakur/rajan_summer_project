class fixture {
  late String fixture_image;
  late String fixture_name;
  fixture({required this.fixture_image, required this.fixture_name});
  factory fixture.fromJson(Map<String, dynamic> json) {
    return fixture(
        fixture_image: json['fixture_image'],
        fixture_name: json['fixture_name']);
  }
}
