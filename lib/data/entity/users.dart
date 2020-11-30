import 'package:floor/floor.dart';

@Entity(tableName: 'users')
class Users {
  @primaryKey
  int id;
  String email;
  String username;
  String name;
  String firstName;
  String lastName;
  String status;
  String startDate;
  String endDate;
  String subscription;
  String image;

  Users(
      {this.id,
      this.email,
      this.username,
      this.name,
      this.firstName,
      this.lastName,
      this.status,
      this.startDate,
      this.endDate,
      this.subscription,
      this.image});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    username = json['username'];
    name = json['name'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    status = json['status'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    subscription = json['subscription'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['username'] = this.username;
    data['name'] = this.name;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['status'] = this.status;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['subscription'] = this.subscription;
    data['image'] = this.image;
    return data;
  }
}
