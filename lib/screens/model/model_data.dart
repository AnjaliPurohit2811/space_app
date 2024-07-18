class SpaceType {
  final String id;
  final String name;
  final String description;
  final String image;
  final String hero;

  SpaceType({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.hero,
  });

  factory SpaceType.fromJson(Map<String, dynamic> json) {
    return SpaceType(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      image: json['image'],
      hero: json['hero'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'image': image,
      'hero': hero,
    };
  }

}
