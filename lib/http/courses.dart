import 'package:dio/dio.dart';
import 'package:tritek_lms/data/entity/courses.dart';

class CoursesResponse {
  final List<Course> results;
  final String error;

  CoursesResponse(this.results, this.error);

  CoursesResponse.fromJson(json)
      : results = (json as List).map((i) => new Course.fromJson(i)).toList(),
        error = "";

  CoursesResponse.withError(String errorValue)
      : results = List(),
        error = errorValue;
}

class CoursesApiProvider {
  final String _endpoint = "http://10.0.2.2/courses";

  // final Uri uri = Uri.http("10.0.2.2", unencodedPath)
  final Dio _dio = Dio();

  Future<CoursesResponse> getCourses() async {
    try {
      Response response = await _dio.get(_endpoint);
      return CoursesResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      // @todo
      print("Exception occurred: $error stackTrace: $stacktrace");
      return CoursesResponse.withError("$error");
    }
  }
}
