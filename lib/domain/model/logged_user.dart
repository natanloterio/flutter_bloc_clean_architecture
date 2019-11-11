import 'package:clean_architecture/domain/model/user.dart';

class LoggedUser {
  String session_id;
  User user;
  LoggedUser({this.session_id, this.user});
}
