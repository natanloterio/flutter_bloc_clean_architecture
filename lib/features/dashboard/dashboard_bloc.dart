import 'package:clean_architecture/data/network/login_repository_impl.dart';
import 'package:clean_architecture/domain/use_cases/login_use_case.dart';
import 'package:clean_architecture/features/dashboard/dashboard_viewmodel.dart';
import 'package:rxdart/rxdart.dart';

class DashboardBloc {
  DashboardViewModel _viewModel;
  LoginUseCase _useCase;
  PublishSubject<DashboardViewModel> _viewPublisher;
  Observable<DashboardViewModel> get viewStream => _viewPublisher.stream;

  DashboardBloc() {
    // Should be used dependency injection here
    _useCase = LoginUseCase(LoginRepositoryImpl());
    _init();
  }

  get initialData {
    return _viewModel;
  }

  _init() {
    _viewModel = DashboardViewModel();
    _viewPublisher = PublishSubject<DashboardViewModel>();
  }

  void onPressLoginButton() {
    _useCase.login(_viewModel.username, _viewModel.password).then((response) {
      print(response.value);
      _viewModel.logged = true;
      _viewModel.username = response.value.user.name;

      _viewPublisher.sink.add(_viewModel);
    }).catchError((error) {
      _viewModel.logged = false;
    });
  }
}
