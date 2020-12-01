import 'package:rxdart/rxdart.dart';
import 'package:tritek_lms/data/repository/user.repository.dart';
import 'package:tritek_lms/http/user.dart';

class UserBloc {
  final UserRepository _repository = UserRepository();
  final BehaviorSubject<UserResponse> _userSubject =
      BehaviorSubject<UserResponse>();

  login(String username, String password) async {
    UserResponse response = await _repository.login(username, password);
    _userSubject.sink.add(response);
  }

  dispose() {
    _userSubject.close();
  }

  BehaviorSubject<UserResponse> get userSubject => _userSubject;
}

final userBloc = UserBloc();
