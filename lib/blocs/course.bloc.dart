import 'package:rxdart/rxdart.dart';
import 'package:tritek_lms/data/repository/course.repository.dart';
import 'package:tritek_lms/http/courses.dart';

class CourseBloc {
  final CourseRepository _repository = CourseRepository();
  final BehaviorSubject<CoursesResponse> _coursesSubject =
      BehaviorSubject<CoursesResponse>();

  getCourses() async {
    CoursesResponse response = await _repository.getCourses();
    _coursesSubject.sink.add(response);
    // _repository.saveCourses(response.results);
  }

  dispose() {
    _coursesSubject.close();
  }

  BehaviorSubject<CoursesResponse> get subject => _coursesSubject;
}

final bloc = CourseBloc();
