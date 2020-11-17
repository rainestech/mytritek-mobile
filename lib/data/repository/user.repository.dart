import 'package:sqflite/sqflite.dart';
import 'package:tritek_lms/data/entity/users.dart';
import 'package:tritek_lms/database/database.dart';

class UserRepository {
  Future<Users> createUser(Users user) async {
    final db = await DBProvider.db.database;
    var res = await db.insert('users', user.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);

    user.id = res;
    return user;
  }

  Future<Users> editUser(Users user) async {
    final db = await DBProvider.db.database;
    // var res = await db.update('users', user.toJson(), where: 'id = ?', whereArgs: [user.id]);
    await db.update('users', user.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);

    return user;
  }

  // deleteUser(Users user) async {
  //   if (user.id != -1) {
  //     final db = await DBProvider.db.database;
  //     db.delete('users', where: 'id = ?', whereArgs: [user.id]);
  //   }
  // }

  Future<bool> deleteUser(Users user) async {
    if (user.id != -1) {
      final Database db = await DBProvider.db.database;
      try {
        await db.delete("users", where: "id = ?", whereArgs: [user.id]);
        return true;
      } catch (Error) {
        print("Error deleting ${user.id}: ${Error.toString()}");
        return false;
      }
    }
  }

  Future<Users> getUser() async {
    final Database db = await DBProvider.db.database;
    var one = await db.query("users", orderBy: "id asc", limit: 1);

    return Users.fromJson(one.first);
  }

  Future<List<Users>> getUsers() async {
    final Database db = await DBProvider.db.database;
    var res = await db.query('users');
    List<Users> users =
        res.isNotEmpty ? res.map((note) => Users.fromJson(note)).toList() : [];

    return users;
  }
}
