// To parse this JSON data, do
//
//     final eventDetailModel = eventDetailModelFromJson(jsonString);

class EventDetailModel {
  EventDetailModel({
    required this.id,
    required this.name,
    required this.description,
    this.poc,
    this.email,
    required this.isCanceled,
    this.mobile,
    required this.location,
    required this.locality,
    required this.category,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.coverImage,
    required this.thumbnailImage,
    required this.latitude,
    required this.longitude,
    required this.isFeatured,
    required this.upcoming,
    this.featuredStartDate,
    this.featuredEndDate,
    required this.totalTickets,
    required this.soldOut,
    required this.ticket,
    required this.gallaryImage,
    required this.isBookmark,
  });

  int id;
  String name;
  String description;
  dynamic poc;
  dynamic email;
  bool isCanceled;
  dynamic mobile;
  String location;
  Category locality;
  Category category;
  DateTime date;
  DateTime startTime;
  DateTime endTime;
  String coverImage;
  String thumbnailImage;
  dynamic latitude;
  dynamic longitude;
  bool isFeatured;
  bool upcoming;
  dynamic featuredStartDate;
  dynamic featuredEndDate;
  int totalTickets;
  int soldOut;
  List<Ticket> ticket;
  List<GallaryImage> gallaryImage;
  bool isBookmark;

  factory EventDetailModel.fromJson(Map<String, dynamic> json) =>
      EventDetailModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        poc: json["poc"],
        email: json["email"],
        isCanceled: json["is_canceled"],
        mobile: json["mobile"],
        location: json["location"],
        locality: Category.fromJson(json["locality"]),
        category: Category.fromJson(json["category"]),
        date: DateTime.parse(json["date"]),
        startTime: DateTime.parse(json["start_time"]),
        endTime: DateTime.parse(json["end_time"]),
        coverImage: json["cover_image"],
        thumbnailImage: json["thumbnail_image"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        isFeatured: json["is_featured"],
        upcoming: json["upcoming"],
        featuredStartDate: json["featured_start_date"],
        featuredEndDate: json["featured_end_date"],
        totalTickets: json["total_tickets"],
        soldOut: json["sold_out"],
        ticket:
            List<Ticket>.from(json["ticket"].map((x) => Ticket.fromJson(x))),
        gallaryImage: List<GallaryImage>.from(
            json["gallary_image"].map((x) => GallaryImage.fromJson(x))),
        isBookmark: json["is_bookmark"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "poc": poc,
        "email": email,
        "is_canceled": isCanceled,
        "mobile": mobile,
        "location": location,
        "locality": locality.toJson(),
        "category": category.toJson(),
        "date": date.toIso8601String(),
        "start_time": startTime.toIso8601String(),
        "end_time": endTime.toIso8601String(),
        "cover_image": coverImage,
        "thumbnail_image": thumbnailImage,
        "latitude": latitude,
        "longitude": longitude,
        "is_featured": isFeatured,
        "upcoming": upcoming,
        "featured_start_date": featuredStartDate,
        "featured_end_date": featuredEndDate,
        "total_tickets": totalTickets,
        "sold_out": soldOut,
        "ticket": List<dynamic>.from(ticket.map((x) => x.toJson())),
        "gallary_image":
            List<dynamic>.from(gallaryImage.map((x) => x.toJson())),
        "is_bookmark": isBookmark,
      };
}

class Category {
  Category({
    required this.name,
    required this.id,
  });

  String name;
  int id;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}

class GallaryImage {
  GallaryImage({
    required this.url,
    required this.id,
  });

  String url;
  int id;

  factory GallaryImage.fromJson(Map<String, dynamic> json) => GallaryImage(
        url: json["url"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "id": id,
      };
}

class Ticket {
  Ticket({
    required this.price,
    required this.id,
    required this.name,
    required this.quantity,
    required this.ticketsLeft,
    required this.description,
    required this.selectDiscount,
    required this.selectminiDiscount,
    required this.platinumDiscount,
  });

  double price;
  int id;
  String name;
  int quantity;
  int ticketsLeft;
  List<String> description;
  double selectDiscount;
  double selectminiDiscount;
  double platinumDiscount;

  factory Ticket.fromJson(Map<String, dynamic> json) => Ticket(
        price: json["price"],
        id: json["id"],
        name: json["name"],
        quantity: json["quantity"],
        ticketsLeft: json["tickets_left"],
        description: List<String>.from(json["description"].map((x) => x)),
        selectDiscount: json["select_discount"],
        selectminiDiscount: json["selectmini_discount"],
        platinumDiscount: json["platinum_discount"],
      );

  Map<String, dynamic> toJson() => {
        "price": price,
        "id": id,
        "name": name,
        "quantity": quantity,
        "tickets_left": ticketsLeft,
        "description": List<dynamic>.from(description.map((x) => x)),
        "select_discount": selectDiscount,
        "selectmini_discount": selectminiDiscount,
        "platinum_discount": platinumDiscount,
      };
}
