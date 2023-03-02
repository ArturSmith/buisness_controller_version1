import 'package:buisness_controller_verison_1/models/main_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../working_widgets/company_widget/company_widget.dart';

class LoginWidgetModel extends ChangeNotifier {
  var login = '';
  var password = '';
  String? errorLogin;
  String? errorPassword;
  bool loginIsExist = false;
  bool rightPassword = false;

  void checkLogin(BuildContext context, String value) {
    login = value;

    if (login.isNotEmpty && context.read<MainModel>().logins.contains(login)) {
      errorLogin = null;
      loginIsExist = true;
    } else if (login.isEmpty) {
      errorLogin = null;
      loginIsExist = false;
    } else if (login.isNotEmpty &&
        !context.read<MainModel>().logins.contains(login)) {
      errorLogin = 'Wrong login';
      loginIsExist = false;
    }
    notifyListeners();
  }

  void checkPassword(BuildContext context, String value) {
    password = value;

    if (password.isNotEmpty && loginIsExist) {
      final CompanyWidget company = context
          .read<MainModel>()
          .companies
          .singleWhere((element) => element.login == login);
      if (company.password == password) {
        errorPassword = null;
        rightPassword = true;
      } else {
        errorPassword = 'Wrong password';
        rightPassword = false;
      }
    } else if (password.isNotEmpty && !loginIsExist) {
      errorPassword = 'Write login first';
      rightPassword = false;
    } else if (password.isEmpty) {
      rightPassword = false;
      errorPassword = null;
    }
    notifyListeners();
  }

  void loginMethod(BuildContext context) {
    if (loginIsExist && rightPassword) {
      final CompanyWidget company = context
          .read<MainModel>()
          .companies
          .singleWhere((element) => element.login == login);
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => company,
        ),
      );
    } else if (login.isEmpty || password.isEmpty) {
      errorLogin = login.isEmpty ? 'Write login' : null;
      errorPassword = password.isEmpty ? 'Write password' : null;
    }
    notifyListeners();
  }
}
