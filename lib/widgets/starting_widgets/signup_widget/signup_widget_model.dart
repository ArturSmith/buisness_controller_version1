import 'package:buisness_controller_verison_1/models/main_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../../working_widgets/company_widget/company_widget.dart';

class SignupWidgetModel extends ChangeNotifier {
  // first data
  var name = '';
  String? errorName;
  var country = '';
  String? errorCountry;
  var city = '';
  String? errorCity;
  var street = '';
  String? errorStreet;

  // second data
  var login = '';
  String? errorLogin;
  bool rightLogin = false;
  var password = '';
  String? errorPassword;
  var confirmedPassword = '';
  String? errorConfirmedPassword;
  bool passwordConfirmed = false;

  // first data methods
  void next(BuildContext context) {
    if (name.isNotEmpty &&
        country.isNotEmpty &&
        city.isNotEmpty &&
        street.isNotEmpty) {
      Navigator.of(context).pushNamed('/SignupWidgetFormsSecond');
    } else if (name.isEmpty ||
        country.isEmpty ||
        city.isEmpty ||
        street.isEmpty) {
      errorName = name.isEmpty ? 'Write name' : null;
      errorCountry = country.isEmpty ? 'Select country' : null;
      errorCity = city.isEmpty ? 'Select city' : null;
      errorStreet = street.isEmpty ? 'Select street' : null;
    }
    notifyListeners();
  }

  // second data methods
  void checkLogin(BuildContext context, String value) {
    login = value;

    if (login.isNotEmpty && context.read<MainModel>().logins.contains(login)) {
      errorLogin = 'Login alredy exists';
      rightLogin = false;
    } else if (login.isNotEmpty &&
        !context.read<MainModel>().logins.contains(login)) {
      rightLogin = true;
      errorLogin = null;
    } else if (login.isEmpty) {
      errorLogin = null;
      rightLogin = false;
    }

    notifyListeners();
  }

  void checkConfirmedPassword(String value) {
    confirmedPassword = value;
    if (password.isNotEmpty && confirmedPassword.isNotEmpty) {
      if (confirmedPassword == password) {
        errorConfirmedPassword = null;
        errorPassword = null;
        passwordConfirmed = true;
      } else {
        passwordConfirmed = false;
        errorPassword = null;
        errorConfirmedPassword = 'Wrong password';
      }
    } else if (password.isEmpty && confirmedPassword.isEmpty) {
      errorConfirmedPassword = null;
      errorPassword = null;
      passwordConfirmed = false;
    } else if (password.isEmpty && confirmedPassword.isNotEmpty) {
      errorConfirmedPassword = 'Write password first';
      errorPassword = null;
      passwordConfirmed = false;
    } else if (confirmedPassword.isEmpty) {
      errorConfirmedPassword = null;
    }

    notifyListeners();
  }

  void signup(BuildContext context) {
    if (rightLogin && passwordConfirmed) {
      context.read<MainModel>().addLogin(login);
      final company = CompanyWidget(
          name: name,
          country: country,
          city: city,
          street: street,
          login: login,
          password: password);
      context.read<MainModel>().addCompany(company);
      Navigator.of(context).pushReplacementNamed('/LoginWidget');
    } else if (rightLogin && !passwordConfirmed) {
      errorConfirmedPassword = 'Confirm password';
    } else if (!rightLogin && passwordConfirmed) {
      errorLogin = 'Write login';
    } else if (!rightLogin && !passwordConfirmed) {
      errorConfirmedPassword = 'Confirm password';
      errorLogin = 'Write login';
    }

    notifyListeners();
  }
}
