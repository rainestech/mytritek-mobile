import 'package:dio/dio.dart';
import 'package:tritek_lms/data/entity/users.dart';
import 'package:tritek_lms/http/endpoints.dart';

class UserResponse {
  final Users results;
  final String error;
  final int length;

  UserResponse(this.results, this.error, this.length);

  UserResponse.fromJson(json, len)
      : results = new Users.fromJson(json),
        error = "",
        length = len;

  UserResponse.withError(String errorValue)
      : results = null,
        error = errorValue,
        length = 0;
}

class UserApiProvider {
  final Dio _dio = Dio();

  Future<UserResponse> loginUser(String username, String password) async {
    try {
      Response response = await _dio
          .post(loginEndpoint, data: {username: username, password: password});
      print(response.data.length);
      return UserResponse.fromJson(response.data, response.data.length);
    } catch (error, stacktrace) {
      // @todo
      print("Exception occurred: $error stackTrace: $stacktrace");
      return UserResponse.withError("$error");
    }
  }

  Future<UserResponse> register(String username, String password,
      String firstName, String lastName, String phoneNo, String email) async {
    try {
      Response response = await _dio.post(loginEndpoint, data: {
        username: username,
        password: password,
        phoneNo: phoneNo,
        lastName: lastName,
        firstName: firstName,
        email: email
      });
      print(response.data.length);
      return UserResponse.fromJson(response.data, response.data.length);
    } catch (error, stacktrace) {
      // @todo
      print("Exception occurred: $error stackTrace: $stacktrace");
      return UserResponse.withError("$error");
    }
  }
}
