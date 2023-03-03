// To parse this JSON data, do
//
//     final ticketDetailModel = ticketDetailModelFromJson(jsonString);


// TicketDetailModel ticketDetailModelFromJson(String str) => TicketDetailModel.fromJson(json.decode(str));

// String ticketDetailModelToJson(TicketDetailModel data) => json.encode(data.toJson());

// class TicketDetailModel {
//     TicketDetailModel({
//         this.status,
//         this.code,
//         this.data,
//     });

//     String? status;
//     int? code;
//     Data? data;

//     factory TicketDetailModel.fromJson(Map<String, dynamic> json) => TicketDetailModel(
//         status: json["status"],
//         code: json["code"],
//         data: json["data"] == null ? null : Data.fromJson(json["data"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "status": status,
//         "code": code,
//         "data": data?.toJson(),
//     };
// }

class TicketDetailModel {
    TicketDetailModel({
        this.attendeeData,
        this.total,
    });

    List<AttendeeDatum>? attendeeData;
    String? total;

    factory TicketDetailModel.fromJson(Map<String, dynamic> json) => TicketDetailModel(
        attendeeData: json["Attendee_data"] == null ? [] : List<AttendeeDatum>.from(json["Attendee_data"]!.map((x) => AttendeeDatum.fromJson(x))),
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "Attendee_data": attendeeData == null ? [] : List<dynamic>.from(attendeeData!.map((x) => x.toJson())),
        "total": total,
    };
}

class AttendeeDatum {
    AttendeeDatum({
        this.name,
        this.mobile,
        this.plan,
        this.price,
    });

    String? name;
    String? mobile;
    String? plan;
    String? price;

    factory AttendeeDatum.fromJson(Map<String, dynamic> json) => AttendeeDatum(
        name: json["name"],
        mobile: json["mobile"],
        plan: json["plan"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "mobile": mobile,
        "plan": plan,
        "price": price,
    };
}
