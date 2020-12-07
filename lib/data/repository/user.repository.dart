import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tritek_lms/appTheme/appTheme.dart';
import 'package:tritek_lms/custom/helper.dart';
import 'package:tritek_lms/data/entity/users.dart';
import 'package:tritek_lms/database/database.dart';
import 'package:tritek_lms/http/user.dart';

class UserRepository {
  UserApiProvider _apiProvider = UserApiProvider();

  Future<UserResponse> login(String username, String password) async {
    UserResponse response = await _apiProvider.loginUser(username, password);
    final storage = new FlutterSecureStorage();

    if (response.error.length < 1) {
      await saveUser(response.results);
      print('Password Resp: ${response.results.password}');
      await storage.write(key: 'token', value: response.results.password);
      getUserLevel(response.results.id);
    }

    if (response.results.image != null && response.results.image.length > 0) {
      SaveFile().saveImage(response.results.image);
    }
    return response;
  }

  Future<RegisterResponse> register(String username, String password,
      String firstName, String lastName, String phoneNo, String email) async {
    RegisterResponse response = await _apiProvider.register(
        username, password, firstName, lastName, phoneNo, email);

    return response;
  }

  Future<RegisterResponse> resetPassword(String email) async {
    RegisterResponse response = await _apiProvider.resetPassword(email);

    return response;
  }

  Future<RegisterResponse> setNewPassword(String email, String password, String otp) async {
    RegisterResponse response =
    await _apiProvider.setNewPassword(email, password, otp);

    return response;
  }

  Future<UserResponse> verify(String otp, String email) async {
    UserResponse response = await _apiProvider.verify(otp, email);

    if (response.error.length < 1) {
      await saveUser(response.results);
    }

    if (response.results.image != null && response.results.image.length > 0) {
      SaveFile().saveImage(response.results.image);
    }

    return response;
  }

  Future<UserResponse> editUser(Users _user) async {
    UserResponse response = await _apiProvider.editUser(_user);

    if (response.error.length < 1) {
      await saveUser(response.results);
    }

    if (response.results.image != null && response.results.image.length > 0) {
      SaveFile().saveImage(response.results.image);
    }

    return response;
  }

  Future<UserResponse> getDbUser() async {
    final database = await $FloorAppDatabase.databaseBuilder(appDB).build();
    final userDao = database.userDao;

    final Users user = await userDao.findAll();

    UserResponse response = UserResponse(user, '', 0, '');
    return response;
  }

  Future<UserLevelResponse> getUserLevel(int userId) async {
    bool conn = await DataConnectionChecker().hasConnection;
    if (!conn) {
      final database = await $FloorAppDatabase.databaseBuilder(appDB).build();
      final userLevelDao = database.userLevelDao;

      final UserLevel level = await userLevelDao.findAll();

      UserLevelResponse response = UserLevelResponse(level, '', 0, '');
      return response;
    }

    final UserLevelResponse level = await _apiProvider.getLevel(userId);
    if (level.data != null) {
      saveUserLevel(level.data);
    }
    return level;
  }

  Future<UserResponse> logout() async {
    await refreshUser();
    SaveFile().deleteImage();
    return null;
  }

  Future<void> saveUser(Users user) async {
    final database = await $FloorAppDatabase.databaseBuilder(appDB).build();
    final userDao = database.userDao;

    await userDao.deleteAll();
    userDao.save(user);
  }

  Future<void> saveUserLevel(UserLevel level) async {
    final database = await $FloorAppDatabase.databaseBuilder(appDB).build();
    final userDao = database.userLevelDao;

    await userDao.deleteAll();
    userDao.save(level);
  }

  Future<void> refreshUser() async {
    final database = await $FloorAppDatabase.databaseBuilder(appDB).build();
    final userDao = database.userDao;
    final userLevelDao = database.userLevelDao;
    await userDao.deleteAll();
    await userLevelDao.deleteAll();
  }
}
