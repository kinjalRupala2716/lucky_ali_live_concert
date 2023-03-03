// To parse this JSON data, do
//
//     final locationBasedEventModel = locationBasedEventModelFromJson(jsonString);




class LocationBasedEventModel {
    LocationBasedEventModel({
        required this.id,
        required this.name,
        required this.coverImage,
        required this.date,
    });

    int id;
    String name;
    String coverImage;
    DateTime date;

    factory LocationBasedEventModel.fromJson(Map<String, dynamic> json) => LocationBasedEventModel(
        id: json["id"],
        name: json["name"],
        coverImage: json["cover_image"],
        date: DateTime.parse(json["date"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "cover_image": coverImage,
        "date": date.toIso8601String(),
    };
}
