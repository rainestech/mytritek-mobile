class CustomerCare {
  int id;
  String name;
  String rank;
  String available;
  String phoneNo;
  String passport;
  DateTime createdAt;
  DateTime updatedAt;

  CustomerCare(
      {this.id,
      this.name,
      this.rank,
      this.available,
      this.phoneNo,
      this.passport,
      this.createdAt,
      this.updatedAt});

  // Create a Note from JSON data
  factory CustomerCare.fromJson(Map<String, dynamic> json) => new CustomerCare(
        id: json["id"],
        name: json["name"],
        rank: json["rank"],
        passport: json["passport"],
        phoneNo: json["phoneNo"],
        available: json["available"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
      );

  // Convert our Note to JSON to make it easier when we store it in the database
  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "rank": rank,
        "available": available,
        "phoneNo": phoneNo,
        "passport": passport,
        "createdAt": epochFromDate(createdAt),
        "updatedAt": epochFromDate(updatedAt),
      };

  // Converting the date time object into int representing seconds passed after midnight 1st Jan, 1970 UTC
  int epochFromDate(DateTime dt) {
    return dt.millisecondsSinceEpoch;
  }

  // Reverse Conversion
  static DateTime dateFromEpoch(int i) {
    return DateTime.fromMicrosecondsSinceEpoch(i);
  }
}
