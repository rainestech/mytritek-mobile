import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tritek_lms/data/repository/user.repository.dart';
import 'package:tritek_lms/http/ping.dart';
import 'package:tritek_lms/http/user.dart';

class UserBloc {
  final FlutterSecureStorage _storage = FlutterSecureStorage();
  final UserRepository _repository = UserRepository();
  final PingResponse _pingResponse = PingResponse();

  final BehaviorSubject<UserResponse> _userSubject =
      BehaviorSubject<UserResponse>();

  final BehaviorSubject<PingServerResp> _pingSubject =
      BehaviorSubject<PingServerResp>();

  final BehaviorSubject<bool> _userStatus = BehaviorSubject<bool>();
  final BehaviorSubject<String> _token = BehaviorSubject<String>();
  final BehaviorSubject<UserLevelResponse> _userLevel =
      BehaviorSubject<UserLevelResponse>();

  login(String username, String password) async {
    UserResponse response = await _repository.login(username, password);
    _userSubject.sink.add(response);
  }

  bool _isDisposed = false;

  dispose() {
    _userSubject.close();
    _userStatus.close();
    _userLevel.close();
    _pingSubject.close();
    _token.close();
    bool _isDisposed = true;
  }

  BehaviorSubject<UserResponse> get userSubject => _userSubject;

  BehaviorSubject<String> get token => _token;

  BehaviorSubject<UserLevelResponse> get userLevel => _userLevel;

  BehaviorSubject<bool> get userStatus => _userStatus;

  BehaviorSubject<PingServerResp> get pingSubject => _pingSubject;

  void getUser() async {
    UserResponse resp = await _repository.getDbUser();
    if (_isDisposed) {
      return;
    }
    _userSubject.sink.add(resp);
    _userStatus.sink.add(resp.results != null);
  }

  void getToken() async {
    var t = await _storage.read(key: 'token') ?? null;
    print('Token: $t');
    _token.sink.add(t);
  }

  void getUserLevel(userId) async {
    UserLevelResponse resp = await _repository.getUserLevel(userId);
    _userLevel.sink.add(resp);
  }

  void pingServer() async {
    PingServerResp resp = await _pingResponse.pingServer();
    _pingSubject.sink.add(resp);
  }

  void logout() async {
    UserResponse resp = await _repository.logout();
    // _userSubject.sink.add(resp);
  }
}

final userBloc = UserBloc();
