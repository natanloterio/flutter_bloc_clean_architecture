class LoginViewModel {
  String label_username;
  String label_password;
  String label_btn_login;
  String label_welcome_text;

  bool is_loading;
  String get label_login_success => username ?? 'Welcome, ${username ?? GEST}';
  String label_error_message;
  String username;
  String password;
  bool logged;

  String USERNAME = 'Username';
  String PASSWORD = 'Password';
  String GEST = 'Gest';
  String BTN_LOGIN = 'Login';
  String ERROR_MESSAGE = 'User or Password incorrect';
  String WELCOME_MESSAGE = 'Welcome, type your name and password';
  String LOGIN_SUCCESS_MESSAGE = 'Welcome,';

  LoginViewModel() {
    label_username = USERNAME;
    label_password = PASSWORD;
    label_btn_login = BTN_LOGIN;
    label_error_message = ERROR_MESSAGE;
    label_welcome_text = WELCOME_MESSAGE;
    logged = false;
  }
}
