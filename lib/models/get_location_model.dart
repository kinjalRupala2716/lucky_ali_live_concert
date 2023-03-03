// To parse this JSON data, do
//
//     final GetLocationModel = GetLocationModelFromJson(jsonString);

import 'dart:convert';

GetLocationModel getLocationModelFromJson(String str) =>
    GetLocationModel.fromJson(json.decode(str));

String getLocationModelToJson(GetLocationModel data) =>
    json.encode(data.toJson());

// class GetLocationModel {
//     GetLocationModel({
//         required this.status,
//         required this.code,
//         required this.message,
//         required this.data,
//     });

//     String status;
//     int code;
//     String message;
//     List<Datum> data;

//     factory GetLocationModel.fromJson(Map<String, dynamic> json) => GetLocationModel(
//         status: json["status"],
//         code: json["code"],
//         message: json["message"],
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "status": status,
//         "code": code,
//         "message": message,
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//     };
// }

class GetLocationModel {
  GetLocationModel({
    this.id,
    this.name,
    this.sectionId,
    this.isActive,
    this.created,
    this.modified,
    this.subLocality,
    this.localityId,
  });

  int? id;
  String? name;
  String? sectionId;
  int? isActive;
  DateTime? created;
  DateTime? modified;
  List<GetLocationModel>? subLocality;
  int? localityId;

  factory GetLocationModel.fromJson(Map<String, dynamic> json) =>
      GetLocationModel(
        id: json["id"],
        name: json["name"],
        sectionId: json["section_id"],
        isActive: json["is_active"],
        created: DateTime.parse(json["created"]),
        modified: DateTime.parse(json["modified"]),
        subLocality: json["sub_locality"] == null
            ? []
            : List<GetLocationModel>.from(
                json["sub_locality"]!.map((x) => GetLocationModel.fromJson(x))),
        localityId: json["locality_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "section_id": sectionId,
        "is_active": isActive,
        "created": created?.toIso8601String(),
        "modified": modified?.toIso8601String(),
        "sub_locality": subLocality == null
            ? []
            : List<dynamic>.from(subLocality!.map((x) => x.toJson())),
        "locality_id": localityId,
      };
}
