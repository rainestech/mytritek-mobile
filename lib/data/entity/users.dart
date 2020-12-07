import 'package:floor/floor.dart';

@Entity(tableName: 'users')
class Users {
  @primaryKey
  int id;
  String email;
  String username;
  @ignore
  String password;
  String name;
  String firstName;
  String lastName;
  String status;
  String startDate;
  String endDate;
  String subscription;
  String image;
  String phoneNo;

  Users(
      {this.id,
      this.email,
      this.username,
      this.password,
      this.name,
      this.firstName,
      this.lastName,
      this.status,
      this.startDate,
      this.endDate,
      this.subscription,
      this.image,
      this.phoneNo});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    username = json['username'];
    password = json['password'];
    name = json['name'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    status = json['status'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    subscription = json['subscription'];
    image = json['image'];
    phoneNo = json['phoneNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['username'] = this.username;
    data['password'] = this.username;
    data['name'] = this.name;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['status'] = this.status;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['subscription'] = this.subscription;
    data['image'] = this.image;
    data['phoneNo'] = this.phoneNo;
    return data;
  }
}

@Entity(tableName: 'userLevel')
class UserLevel {
  String level;
  String award;
  String points;
  String newPoint;
  String deduct;

  @primaryKey
  String userId;
  String badge;

  UserLevel({this.level,
    this.award,
    this.points,
    this.newPoint,
    this.deduct,
    this.userId,
    this.badge});

  UserLevel.fromJson(Map<String, dynamic> json) {
    level = json['level'];
    award = json['award'];
    points = json['points'];
    newPoint = json['newPoint'];
    deduct = json['deduct'];
    userId = json['userId'];
    badge = json['badge'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['level'] = this.level;
    data['award'] = this.award;
    data['points'] = this.points;
    data['newPoint'] = this.newPoint;
    data['deduct'] = this.deduct;
    data['userId'] = this.userId;
    data['badge'] = this.badge;
    return data;
  }
}
