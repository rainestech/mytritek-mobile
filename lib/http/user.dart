import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:tritek_lms/data/entity/users.dart';
import 'package:tritek_lms/http/endpoints.dart';
import 'package:tritek_lms/http/http.client.dart';

class UserResponse {
  final Users results;
  final String error;
  final String eTitle;
  final int length;

  UserResponse(this.results, this.error, this.length, this.eTitle);

  UserResponse.fromJson(resp, len)
      : results = new Users.fromJson(resp),
        error = "",
        eTitle = "",
        length = len;

  UserResponse.withError(String msg, title)
      : results = null,
        error = msg,
        eTitle = title,
        length = 0;
}

class UserLevelResponse {
  final UserLevel data;
  final String error;
  final String eTitle;
  final int length;

  UserLevelResponse(this.data, this.error, this.length, this.eTitle);

  UserLevelResponse.fromJson(resp, len)
      : data = new UserLevel.fromJson(resp),
        error = "",
        eTitle = "",
        length = len;

  UserLevelResponse.withError(String msg, title)
      : data = null,
        error = msg,
        eTitle = title,
        length = 0;
}

class RegisterResponse {
  final String otp;
  final String error;
  final String eTitle;

  RegisterResponse(this.otp, this.error, this.eTitle);

  RegisterResponse.fromJson(resp)
      : otp = resp['otp'],
        error = "",
        eTitle = "";

  RegisterResponse.withError(String msg, String title)
      : otp = null,
        eTitle = title,
        error = msg;
}

class UserApiProvider {
  Future<UserResponse> loginUser(String username, String password) async {
    try {
      final Dio _dio = await HttpClient.http();
      Response response = await _dio.post(loginEndpoint,
          data: {'username': username, 'password': password});
      print(response.data.length);
      return UserResponse.fromJson(response.data, response.data.length);
    } catch (e) {
      if (e.response != null) {
        Map<String, dynamic> error = json.decode(e.response.toString());
        return UserResponse.withError(error['message'], error['error']);
      }
      return UserResponse.withError(e.message, "Network Error");
    }
  }

  Future<UserLevelResponse> getLevel(int userId) async {
    try {
      final Dio _dio = await HttpClient.http();
      Response response = await _dio.get(levelEndpoint + userId.toString());
      return UserLevelResponse.fromJson(response.data, response.data.length);
    } catch (e) {
      if (e.response != null) {
        Map<String, dynamic> error = json.decode(e.response.toString());
        return UserLevelResponse.withError(error['message'], error['error']);
      }
      return UserLevelResponse.withError(e.message, "Network Error");
    }
  }

  Future<RegisterResponse> register(String username, String password,
      String firstName, String lastName, String phoneNo, String email) async {
    try {
      final Dio _dio = await HttpClient.http();
      Response response = await _dio.post(registerEndpoint, data: {
        'username': username,
        'password': password,
        'phoneNo': phoneNo,
        'lastName': lastName,
        'firstName': firstName,
        'email': email
      });

      return RegisterResponse.fromJson(response.data);
    } catch (e) {
      if (e.response != null) {
        Map<String, dynamic> error = json.decode(e.response.toString());
        return RegisterResponse.withError(error['message'], error['error']);
      }
      return RegisterResponse.withError(e.message, "Network Error");
    }
  }

  Future<RegisterResponse> resetPassword(String email) async {
    final Dio _dio = await HttpClient.http();
    try {
      print("Email: $email");
      Response response = await _dio.post(resetPasswordEndpoint, data: {
        'email': email,
      });

      return RegisterResponse.fromJson(response.data);
    } catch (e) {
      if (e.response != null) {
        Map<String, dynamic> error = json.decode(e.response.toString());
        return RegisterResponse.withError(error['message'], error['error']);
      }
      return RegisterResponse.withError(e.message, "Network Error");
    }
  }

  Future<RegisterResponse> setNewPassword(
      String email, String password, String otp) async {
    try {
      final Dio _dio = await HttpClient.http();
      Response response = await _dio.post(passwordEndpoint,
          data: {'email': email, 'otp': otp, 'password': password});

      return RegisterResponse.fromJson(response.data);
    } catch (e) {
      if (e.response != null) {
        Map<String, dynamic> error = json.decode(e.response.toString());
        return RegisterResponse.withError(error['message'], error['error']);
      }
      return RegisterResponse.withError(e.message, "Network Error");
    }
  }

  Future<UserResponse> verify(String otp, String email) async {
    try {
      final Dio _dio = await HttpClient.http();
      Response response =
          await _dio.post(registerEndpoint, data: {'otp': otp, 'email': email});

      return UserResponse.fromJson(response.data, response.data.length);
    } catch (e) {
      if (e.response != null) {
        Map<String, dynamic> error = json.decode(e.response.toString());
        return UserResponse.withError(error['message'], error['error']);
      }
      return UserResponse.withError(e.message, "Network Error");
    }
  }

  Future<UserResponse> editUser(Users _user) async {
    try {
      final Dio _dio = await HttpClient.http();
      Response response = await _dio.put(editUserEndpoint, data: _user);

      return UserResponse.fromJson(response.data, response.data.length);
    } catch (e) {
      if (e.response != null) {
        Map<String, dynamic> error = json.decode(e.response.toString());
        return UserResponse.withError(error['message'], error['error']);
      }
      return UserResponse.withError(e.message, "Network Error");
    }
  }
}
