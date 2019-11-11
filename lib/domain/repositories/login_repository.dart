import 'package:clean_architecture/domain/model/logged_user.dart';
import 'package:clean_architecture/domain/repositories/response_states.dart';

abstract class LoginRepository {
  Future<State<LoggedUser>> login(String user_name, String password);
}
