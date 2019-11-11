import 'package:clean_architecture/features/login/login_bloc.dart';
import 'package:clean_architecture/features/login/login_viewmodel.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  LoginBloc _bloc;

  LoginScreen() {
    _bloc = LoginBloc();
  }

  @override
  Widget build(BuildContext context) {
    Key _formKey = Key('form');
    return Center(
      child: StreamBuilder<LoginViewModel>(
          initialData: _bloc.initialData,
          stream: _bloc.viewStream,
          builder: (context, snapshot) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Username:'),
                    TextFormField(
                      onChanged: (value) {
                        _bloc.onUpdateUserName(value);
                      },
                    ),
                    Text('Password:'),
                    TextFormField(
                      onChanged: (value) {
                        _bloc.onUpdatePassword(value);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: RaisedButton(
                        onPressed: () {
                          _bloc.onPressLoginButton();
                        },
                        child: Text(snapshot.data?.label_btn_login),
                      ),
                    ),
                    Spacer(),
                    buildSucessMessage(snapshot),
                  ],
                ),
              ),
            );
          }),
    );
  }

  buildSucessMessage(AsyncSnapshot<LoginViewModel> snapshot) {
    if (snapshot.data.logged) {
      return Center(
        child: Text(snapshot.data.label_login_success),
      );
    } else {
      return Center();
    }
  }
}
