import 'package:buisness_controller_verison_1/helpers/button_common_style.dart';
import 'package:buisness_controller_verison_1/helpers/text_field_decoration.dart';
import 'package:buisness_controller_verison_1/models/main_model.dart';
import 'package:buisness_controller_verison_1/widgets/working_widgets/company_widget/company_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupWidgetFormsSecond extends StatefulWidget {
  const SignupWidgetFormsSecond(
      {super.key,
      required this.name,
      required this.country,
      required this.city,
      required this.street});
  final String name;
  final String country;
  final String city;
  final String street;

  @override
  State<SignupWidgetFormsSecond> createState() =>
      _SignupWidgetFormsSecondState();
}

class _SignupWidgetFormsSecondState extends State<SignupWidgetFormsSecond> {
  final TextEditingController loginCont = TextEditingController();
  final TextEditingController passwordCont = TextEditingController();
  final TextEditingController confirmedPasswordCont = TextEditingController();

  String? errorLogin, errorPassword, errorConfirmedPassword;

  void signup() {
    final String login = loginCont.text;
    final String password = passwordCont.text;
    final String confirmedPassword = confirmedPasswordCont.text;

    errorLogin = login == '' ? 'Write login' : null;
    errorPassword = password == '' ? 'Write password' : null;
    errorConfirmedPassword =
        confirmedPassword == '' ? 'Confirm your password' : null;

    if (login.isNotEmpty &&
        password.isNotEmpty &&
        confirmedPassword.isNotEmpty) {
      if (!context.read<MainModel>().logins.contains(login)) {
        if (confirmedPassword == password) {
          context.read<MainModel>().addLogin(login);
          final company = CompanyWidget(
              name: widget.name,
              country: widget.country,
              city: widget.city,
              street: widget.street,
              login: login,
              password: password);
          context.read<MainModel>().addCompany(company);
          Navigator.of(context).pushReplacementNamed('/LoginWidget');
        } else {
          errorConfirmedPassword = "Wrong password";
        }
      } else {
        errorLogin = 'Login already exists';
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const Spacer(flex: 20),
            TextField(
              controller: loginCont,
              decoration: TextFieldDecoration(errorLogin, 'Login').decoration(),
            ),
            const Spacer(flex: 3),
            TextField(
              controller: passwordCont,
              decoration:
                  TextFieldDecoration(errorPassword, 'Password').decoration(),
            ),
            const Spacer(flex: 3),
            TextField(
              controller: confirmedPasswordCont,
              decoration: TextFieldDecoration(
                      errorConfirmedPassword, 'Confirm password')
                  .decoration(),
            ),
            const Spacer(flex: 3),
            ElevatedButton(
                style: ButtonCommonStyle().buttonStyle,
                onPressed: (() {
                  signup();
                }),
                child: const Text(
                  'Signup',
                  style: TextStyle(color: Colors.black),
                )),
            const Spacer(flex: 20)
          ],
        ),
      ),
    ));
  }
}
