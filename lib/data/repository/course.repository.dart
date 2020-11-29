import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tritek_lms/appTheme/appTheme.dart';
import 'package:tritek_lms/data/entity/courses.dart';
import 'package:tritek_lms/database/database.dart';
import 'package:tritek_lms/http/courses.dart';

class CourseRepository {
  CoursesApiProvider _apiProvider = CoursesApiProvider();

  Future<CoursesResponse> getCourses() async {
    bool conn = await DataConnectionChecker().hasConnection;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int courseResp = prefs.getInt('courseResp') ?? 0;
    print("CourseResp: $courseResp");

    if (!conn && courseResp > 0) {
      print('no connection');
      return getDbCourses();
    }
    // return getDbCourses();

    CoursesResponse response = await _apiProvider.getCourses();

    if (response.length != courseResp && response.results.length > 0) {
      await saveCourses(response.results);
      await prefs.setInt('courseResp', response.length);
    }

    return response;
  }

  Future<CoursesResponse> getDbCourses() async {
    final database = await $FloorAppDatabase.databaseBuilder(appDB).build();
    final courseDao = database.courseDao;
    final sectionsDao = database.sectionsDao;
    final lessonsDao = database.lessonsDao;
    final instructorDao = database.instructorDao;
    final commentDao = database.commentsDao;

    final List<Course> courses = await courseDao.findAll();

    for (Course course in courses) {
      final List<Sections> sections =
          await sectionsDao.findByCourseId(course.id);
      for (Sections section in sections) {
        final List<Lessons> lessons =
            await lessonsDao.findBySectionId(section.id);
        section.lessons = lessons;
      }

      final Instructor instructor = await instructorDao.findById(course.userId);
      final List<Comments> comments =
          await commentDao.findByCourseId(course.id);

      course.comments = comments;
      course.instructor = instructor;
      course.sections = sections;
    }

    CoursesResponse response = CoursesResponse(courses, '', 0);
    return response;
  }

  Future<void> saveCourses(List<Course> courses) async {
    final database = await $FloorAppDatabase.databaseBuilder(appDB).build();
    final courseDao = database.courseDao;
    final sectionsDao = database.sectionsDao;
    final lessonsDao = database.lessonsDao;
    final instructorDao = database.instructorDao;
    final commentDao = database.commentsDao;

    await instructorDao.deleteAll();
    await commentDao.deleteAll();
    await lessonsDao.deleteAll();
    await sectionsDao.deleteAll();
    await courseDao.deleteAll();

    for (Course course in courses) {
      courseDao.save(course);
      final List<Sections> sections = course.sections;
      for (Sections section in sections) {
        sectionsDao.save(section);
        final List<Lessons> lessons = section.lessons;
        for (Lessons lesson in lessons) {
          lessonsDao.save(lesson);
        }
      }

      instructorDao.save(course.instructor);
      for (Comments comment in course.comments) {
        commentDao.save(comment);
      }
    }
  }

  Future<void> refreshCourses() async {
    final database = await $FloorAppDatabase.databaseBuilder(appDB).build();
    final courseDao = database.courseDao;
    final sectionsDao = database.sectionsDao;
    final lessonsDao = database.lessonsDao;
    final instructorDao = database.instructorDao;
    final commentDao = database.commentsDao;

    await instructorDao.deleteAll();
    await commentDao.deleteAll();
    await lessonsDao.deleteAll();
    await sectionsDao.deleteAll();
    await courseDao.deleteAll();
  }
}
