import 'package:tritek_lms/appTheme/appTheme.dart';
import 'package:tritek_lms/data/entity/users.dart';
import 'package:tritek_lms/database/database.dart';
import 'package:tritek_lms/http/user.dart';

class UserRepository {
  UserApiProvider _apiProvider = UserApiProvider();

  Future<UserResponse> login(String username, String password) async {
    UserResponse response = await _apiProvider.loginUser(username, password);

    if (response.error.length < 1) {
      await saveUser(response.results);
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

  Future<RegisterResponse> setNewPassword(
      String email, String password, String otp) async {
    RegisterResponse response =
        await _apiProvider.setNewPassword(email, password, otp);

    return response;
  }

  Future<UserResponse> verify(String otp, String email) async {
    UserResponse response = await _apiProvider.verify(otp, email);

    if (response.error.length < 1) {
      await saveUser(response.results);
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

  Future<void> saveUser(Users user) async {
    final database = await $FloorAppDatabase.databaseBuilder(appDB).build();
    final userDao = database.userDao;

    await userDao.deleteAll();
    userDao.save(user);
  }

  Future<void> refreshUser() async {
    final database = await $FloorAppDatabase.databaseBuilder(appDB).build();
    final userDao = database.userDao;
    await userDao.deleteAll();
  }
}
