import 'package:rxdart/rxdart.dart';
import 'package:tritek_lms/data/repository/course.repository.dart';
import 'package:tritek_lms/data/repository/user.repository.dart';
import 'package:tritek_lms/http/courses.dart';
import 'package:tritek_lms/http/user.dart';

class CourseBloc {
  final CourseRepository _repository = CourseRepository();
  final BehaviorSubject<CoursesResponse> _coursesSubject =
      BehaviorSubject<CoursesResponse>();

  final BehaviorSubject<CourseResponse> _courseSubject =
      BehaviorSubject<CourseResponse>();

  final UserRepository _userRepository = UserRepository();
  final BehaviorSubject<UserResponse> _userSubject =
      BehaviorSubject<UserResponse>();

  BehaviorSubject<UserResponse> get userSubject => _userSubject;

  void getUser() async {
    UserResponse resp = await _userRepository.getDbUser();
    _userSubject.sink.add(resp);
  }

  getCourses() async {
    CoursesResponse response = await _repository.getCourses();
    _coursesSubject.sink.add(response);
  }

  getMyCourses(int userId) async {
    CoursesResponse response = await _repository.getMyCourses(userId);
    _coursesSubject.sink.add(response);
  }

  getMyCourseById(int userId, int courseId) async {
    CourseResponse response = await _repository.getMyCourse(userId, courseId);
    _courseSubject.sink.add(response);
  }

  dispose() {
    _coursesSubject.close();
    _courseSubject.close();
    _userSubject.close();
  }

  BehaviorSubject<CoursesResponse> get subject => _coursesSubject;

  BehaviorSubject<CourseResponse> get course => _courseSubject;
}

final bloc = CourseBloc();
