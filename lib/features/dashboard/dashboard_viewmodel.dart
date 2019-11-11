class DashboardViewModel {
  String label_username;
  String label_btn_logout;
  String get label_welcome_text => username ?? 'Welcome, ${username ?? GEST}';
  String label_error_message;
  String username;
  String password;
  bool logged;

  String GEST = 'Gest';
  String BTN_LOGIN = 'Logout';
  String ERROR_MESSAGE = 'User or Password incorrect';
  String WELCOME_MESSAGE = 'Welcome, type your name and password';
  String LOGIN_SUCCESS_MESSAGE = 'Welcome,';

  LoginViewModel() {
    label_btn_logout = BTN_LOGIN;
    label_error_message = ERROR_MESSAGE;
    logged = false;
  }
}
