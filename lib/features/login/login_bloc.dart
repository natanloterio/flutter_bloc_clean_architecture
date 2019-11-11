import 'package:clean_architecture/data/network/login_repository_impl.dart';
import 'package:clean_architecture/domain/use_cases/login_use_case.dart';
import 'package:clean_architecture/features/login/login_viewmodel.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc {
  LoginViewModel _viewModel;
  LoginUseCase _useCase;
  PublishSubject<LoginViewModel> _viewPublisher;
  Observable<LoginViewModel> get viewStream => _viewPublisher.stream;

  LoginBloc() {
    // Should be used dependency injection here
    _useCase = LoginUseCase(LoginRepositoryImpl());
    _init();
  }

  get initialData {
    return _viewModel;
  }

  _init() {
    _viewModel = LoginViewModel();
    _viewPublisher = PublishSubject<LoginViewModel>();
  }

  void onPressLoginButton() {
    _viewModel.is_loading = true;
    _viewPublisher.sink.add(_viewModel);

    _useCase.login(_viewModel.username, _viewModel.password).then((response) {
      print(response.value);
      _viewModel.logged = true;
      _viewModel.username = response.value.user.name;
      _viewModel.label_login_success;

      _viewPublisher.sink.add(_viewModel);
    }).catchError((error) {
      _viewModel.logged = false;
    });
  }

  void onUpdateUserName(String value) {
    _viewModel.username = value;
  }

  void onUpdatePassword(String value) {
    _viewModel.password = value;
  }
}
