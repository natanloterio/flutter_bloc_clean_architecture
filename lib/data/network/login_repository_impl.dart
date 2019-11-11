import 'dart:async';

import 'package:clean_architecture/domain/entities/logged_user.dart';
import 'package:clean_architecture/domain/entities/user.dart';
import 'package:clean_architecture/domain/repositories/login_repository.dart';
import 'package:clean_architecture/domain/repositories/repository_response.dart';
import 'package:dio/dio.dart';

class LoginRepositoryImpl implements LoginRepository {
  static const String _BASE_URL = "http://www.mocky.io/v2/";
  static const String _LOGIN = "5dc338522f0000a9014be699";
  @override
  Future<State<LoggedUser>> login(String user_name, String password) async {
    var comleter = Completer<State<LoggedUser>>();
    var dio = Dio();

    dio.post(_BASE_URL + _LOGIN, data: {}).then((response) {
      Map<String, dynamic> loggedUserJSON = response.data;

      LoggedUser loggedUser = LoggedUser(
          session_id: loggedUserJSON['session_id'],
          user: User(
            name: loggedUserJSON['user']['name'],
            profile_pic: loggedUserJSON['user']['profile_pic'],
          ));

      comleter.complete(State<LoggedUser>.success(loggedUser));
    }).catchError((error) {
      print(error);
    });

    return comleter.future;
  }
}
