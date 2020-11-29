// import 'package:sqflite/sqflite.dart';
// import 'package:tritek_lms/data/entity/ccagents.dart';
// import 'package:tritek_lms/database/database.dart';
//
// class CustomerCareRepository {
//   Future<CustomerCare> createAgent(CustomerCare user) async {
//     final db = await DBProvider.db.database;
//     var res = await db.insert('customerCare', user.toJson(),
//         conflictAlgorithm: ConflictAlgorithm.replace);
//
//     user.id = res;
//     return user;
//   }
//
//   Future<CustomerCare> editAgent(CustomerCare user) async {
//     final db = await DBProvider.db.database;
//     await db.update('customerCare', user.toJson(),
//         conflictAlgorithm: ConflictAlgorithm.replace);
//
//     return user;
//   }
//
//   // deleteUser(Users user) async {
//   //   if (user.id != -1) {
//   //     final db = await DBProvider.db.database;
//   //     db.delete('users', where: 'id = ?', whereArgs: [user.id]);
//   //   }
//   // }
//
//   Future<bool> deleteAgent(CustomerCare user) async {
//     if (user.id != -1) {
//       final Database db = await DBProvider.db.database;
//       try {
//         await db.delete("customerCare", where: "id = ?", whereArgs: [user.id]);
//         return true;
//       } catch (Error) {
//         print("Error deleting ${user.id}: ${Error.toString()}");
//         return false;
//       }
//     }
//   }
//
//   Future<List<CustomerCare>> getAgents() async {
//     final Database db = await DBProvider.db.database;
//     var res = await db.query('customerCare');
//     List<CustomerCare> users = res.isNotEmpty
//         ? res.map((note) => CustomerCare.fromJson(note)).toList()
//         : [];
//
//     return users;
//   }
// }
