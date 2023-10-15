class Source {
  String id, name;

  //making a constructor
  Source({
    required this.id,
    required this.name,
  });

  //creating a factory function
  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      id: json['id'] ?? 'Default id',
      name: json['name'],
    );
  }
}
