import 'package:clean_architecture/features/dashboard/dashboard_bloc.dart';
import 'package:clean_architecture/features/dashboard/dashboard_viewmodel.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  DashboardBloc _bloc;

  DashboardScreen() {
    _bloc = DashboardBloc();
  }

  @override
  Widget build(BuildContext context) {
    Key _formKey = Key('form');
    return Center(
      child: StreamBuilder<DashboardViewModel>(
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
                    Center(
                      child: Text(snapshot.data.label_welcome_text),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(snapshot.data.label_btn_logout),
                              TextFormField(
                                onChanged: (value) {
                                  //_bloc.onUpdateUserName(value);
                                },
                              ),
                              Text('Password:'),
                              TextFormField(
                                onChanged: (value) {
                                  //_bloc.onUpdatePassword(value);
                                },
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: RaisedButton(
                                  onPressed: () {
                                    _bloc.onPressLoginButton();
                                  },
                                  child: Text(snapshot.data?.label_btn_logout),
                                ),
                              ),
                              Spacer(),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
