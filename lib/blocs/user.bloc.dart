import 'package:rxdart/rxdart.dart';
import 'package:tritek_lms/data/repository/user.repository.dart';
import 'package:tritek_lms/http/user.dart';

class UserBloc {
  final UserRepository _repository = UserRepository();
  final BehaviorSubject<UserResponse> _userSubject =
      BehaviorSubject<UserResponse>();

  final BehaviorSubject<bool> _userStatus = BehaviorSubject<bool>();
  final BehaviorSubject<UserLevelResponse> _userLevel =
      BehaviorSubject<UserLevelResponse>();

  login(String username, String password) async {
    UserResponse response = await _repository.login(username, password);
    _userSubject.sink.add(response);
  }

  dispose() {
    _userSubject.close();
    _userStatus.close();
    _userLevel.close();
  }

  BehaviorSubject<UserResponse> get userSubject => _userSubject;

  BehaviorSubject<UserLevelResponse> get userLevel => _userLevel;

  BehaviorSubject<bool> get userStatus => _userStatus;

  void getUser() async {
    UserResponse resp = await _repository.getDbUser();
    _userSubject.sink.add(resp);
    _userStatus.sink.add(resp.results != null);
  }

  void getUserLevel(userId) async {
    UserLevelResponse resp = await _repository.getUserLevel(userId);
    _userLevel.sink.add(resp);
  }

  void logout() async {
    UserResponse resp = await _repository.logout();
    // _userSubject.sink.add(resp);
  }
}

final userBloc = UserBloc();
