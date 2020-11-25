import 'package:tritek_lms/http/courses.dart';

class CourseRepository {
  CoursesApiProvider _apiProvider = CoursesApiProvider();

  Future<CoursesResponse> getCourses() {
    return _apiProvider.getCourses();
  }
}
