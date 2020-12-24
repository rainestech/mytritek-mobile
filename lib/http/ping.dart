import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as Sec;

import 'endpoints.dart';
import 'http.client.dart';

class PingServerResp {
  final Ping data;
  final String error;

  PingServerResp(this.data, this.error);

  PingServerResp.fromJson(resp)
      : data = new Ping.fromJson(resp),
        error = "";

  PingServerResp.withError(String msg)
      : data = null,
        error = msg;
}

class Ping {
  int id;
  String uuid;
  String createdAt;
  String updatedAt;

  Ping({this.id, this.uuid, this.createdAt, this.updatedAt});

  Ping.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    uuid = json['uuid'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['uuid'] = this.uuid;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}

class PingResponse {
  final Sec.FlutterSecureStorage _secureStorage = Sec.FlutterSecureStorage();

  Future<PingServerResp> pingServer() async {
    try {
      final Dio _dio = await HttpClient.http();
      Response response = await _dio.get(pingEndpoint);
      Ping resp = Ping.fromJson(response.data);
      debugPrint('Ping: ${resp.uuid}');
      await _secureStorage.write(key: 'ping', value: resp.uuid);

      return PingServerResp(resp, '');
    } catch (e) {
      debugPrint('Ping Error: ${e.toString()}');
      return PingServerResp(null, 'error');
    }
  }
}
