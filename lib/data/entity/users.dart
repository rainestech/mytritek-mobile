class Users {
  int id;
  String username;
  String firstName;
  String lastName;
  String email;
  String phoneNo;
  String token;
  String passport;
  DateTime createdAt;
  DateTime updatedAt;

  Users({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNo,
    this.token,
    this.passport,
  });

  // Create a Note from JSON data
  factory Users.fromJson(Map<String, dynamic> json) => new Users(
        id: json["id"],
        username: json["username"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        phoneNo: json["phoneNo"],
        token: json["token"],
        passport: json["passport"],
      );

  // Convert our Note to JSON to make it easier when we store it in the database
  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "phoneNo": phoneNo,
        "token": token,
        "passport": passport,
      };

  // Converting the date time object into int representing seconds passed after midnight 1st Jan, 1970 UTC
  int epochFromDate(DateTime dt) {
    return dt.millisecondsSinceEpoch ~/ 1000;
  }
}
