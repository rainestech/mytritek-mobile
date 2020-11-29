import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:tritek_lms/data/entity/courses.dart';
import 'package:tritek_lms/http/endpoints.dart';

class CoursesResponse {
  final List<Course> results;
  final String error;
  final int length;

  CoursesResponse(this.results, this.error, this.length);

  CoursesResponse.fromJson(json, len)
      : results = (json as List).map((i) => new Course.fromJson(i)).toList(),
        error = "",
        length = len;

  CoursesResponse.withError(String errorValue)
      : results = List(),
        error = errorValue,
        length = 0;
}

class CoursesApiProvider {
  final Dio _dio = Dio();

  Future<CoursesResponse> getCourses() async {
    try {
      Response response = await _dio.get(coursesEndpoint,
          options: Options(method: 'GET', responseType: ResponseType.plain));
      print(response.data.length);
      return CoursesResponse.fromJson(
          json.decode(response.data), response.data.length);
    } catch (error, stacktrace) {
      // @todo
      print("Exception occurred: $error stackTrace: $stacktrace");
      return CoursesResponse.withError("$error");
    }
  }
}
