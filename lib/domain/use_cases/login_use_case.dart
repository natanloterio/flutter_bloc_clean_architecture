import 'dart:async';

import 'package:clean_architecture/domain/model/logged_user.dart';
import 'package:clean_architecture/domain/repositories/login_repository.dart';
import 'package:clean_architecture/domain/repositories/repository_response.dart';

class LoginUseCase {
  final LoginRepository _repository;

  LoginUseCase(this._repository);

  Future<State<LoggedUser>> login(String user_name, String password) {
    var _completer = Completer<State<LoggedUser>>();

    _repository.login(user_name, password).then((response) {
      _completer.complete(State<LoggedUser>.success(response.value));
    }).catchError((error) {
      print(error);
      _completer.completeError(State<LoggedUser>.error(error));
    });

    return _completer.future;
  }
}
