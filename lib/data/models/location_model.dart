class Location {
  final String? name;
  final String? url;

  Location({this.name, this.url});

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json['name'],
        url: json['url'],
      );
}
