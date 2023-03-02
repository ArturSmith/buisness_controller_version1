import 'package:buisness_controller_verison_1/helpers/button_common_style.dart';
import 'package:buisness_controller_verison_1/helpers/text_field_decoration.dart';
import 'package:buisness_controller_verison_1/models/main_model.dart';
import 'package:buisness_controller_verison_1/widgets/working_widgets/company_widget/company_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginWidgetForms extends StatefulWidget {
  const LoginWidgetForms({super.key});

  @override
  State<LoginWidgetForms> createState() => _LoginWidgetFormsState();
}

class _LoginWidgetFormsState extends State<LoginWidgetForms> {
  final TextEditingController loginCont = TextEditingController();
  final TextEditingController passwordCont = TextEditingController();

  String? errorLogin, errorPassword;

  void login() {
    final login = loginCont.text;
    final password = passwordCont.text;

    errorLogin = login == '' ? 'Write login' : null;
    errorPassword = password == '' ? 'Write password' : null;

    if (login.isNotEmpty && password.isNotEmpty) {
      if (context.read<MainModel>().logins.contains(login)) {
        final CompanyWidget company = context
            .read<MainModel>()
            .companies
            .singleWhere((element) => element.login == login);
        if (company.password == password) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => company,
            ),
          );
        } else {
          errorPassword = 'Wrong password';
        }
      } else {
        errorLogin = 'Login does not exist';
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
          ElevatedButton(
            style: ButtonCommonStyle().buttonStyle,
            onPressed: () {
              login();
            },
            child: const Text(
              'Login',
              style: TextStyle(color: Colors.black),
            ),
          ),
          const Spacer(flex: 20)
        ],
      ),
    );
  }
}
