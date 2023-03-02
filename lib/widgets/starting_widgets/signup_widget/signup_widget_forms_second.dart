import 'package:buisness_controller_verison_1/helpers/app_colors.dart';
import 'package:buisness_controller_verison_1/helpers/button_common_style.dart';
import 'package:buisness_controller_verison_1/helpers/text_field_decoration.dart';
import 'package:buisness_controller_verison_1/widgets/starting_widgets/signup_widget/signup_widget_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupWidgetFormsSecond extends StatefulWidget {
  const SignupWidgetFormsSecond({
    super.key,
  });

  @override
  State<SignupWidgetFormsSecond> createState() =>
      _SignupWidgetFormsSecondState();
}

class _SignupWidgetFormsSecondState extends State<SignupWidgetFormsSecond> {
  final TextEditingController loginCont = TextEditingController();
  final TextEditingController passwordCont = TextEditingController();
  final TextEditingController confirmedPasswordCont = TextEditingController();

  String? errorLogin, errorPassword, errorConfirmedPassword;

  SignupWidgetModel readModel(BuildContext context) {
    return context.read<SignupWidgetModel>();
  }

  SignupWidgetModel watchModel(BuildContext context) {
    return context.watch<SignupWidgetModel>();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors().appBarColor,
        title: const Text('Create login and password'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const Spacer(flex: 20),
            TextField(
              onChanged: (value) {
                readModel(context).checkLogin(context, value);
              },
              controller: loginCont,
              decoration:
                  TextFieldDecoration(watchModel(context).errorLogin, 'Login')
                      .decoration(),
            ),
            const Spacer(flex: 3),
            TextField(
              onChanged: (value) {
                context.read<SignupWidgetModel>().password = value;
              },
              controller: passwordCont,
              decoration: TextFieldDecoration(
                      watchModel(context).errorPassword, 'Password')
                  .decoration(),
            ),
            const Spacer(flex: 3),
            TextField(
              onChanged: (value) {
                readModel(context).checkConfirmedPassword(value);
              },
              controller: confirmedPasswordCont,
              decoration: TextFieldDecoration(
                      watchModel(context).errorConfirmedPassword,
                      'Confirm password')
                  .decoration(),
            ),
            const Spacer(flex: 3),
            ElevatedButton(
                style: ButtonCommonStyle().buttonStyle,
                onPressed: (() {
                  readModel(context).signup(context);
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
