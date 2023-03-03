import 'package:buisness_controller_verison_1/helpers/button_common_style.dart';
import 'package:buisness_controller_verison_1/helpers/text_field_decoration.dart';
import 'package:buisness_controller_verison_1/widgets/starting_widgets/login_widget/login_widget_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginWidgetForms extends StatelessWidget {
  const LoginWidgetForms({super.key});

  LoginWidgetModel readModel(BuildContext context) {
    return context.read<LoginWidgetModel>();
  }

  LoginWidgetModel watchModel(BuildContext context) {
    return context.watch<LoginWidgetModel>();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          const Spacer(flex: 20),
          TextField(
            onChanged: (value) {
              readModel(context).checkLogin(context, value);
            },
            decoration:
                TextFieldDecoration(watchModel(context).errorLogin, 'Login')
                    .decoration(),
          ),
          const Spacer(flex: 3),
          TextField(
            onChanged: (value) {
              readModel(context).checkPassword(context, value);
            },
            decoration: TextFieldDecoration(
                    watchModel(context).errorPassword, 'Password')
                .decoration(),
          ),
          const Spacer(flex: 3),
          ElevatedButton(
            style: ButtonCommonStyle().buttonStyle,
            onPressed: () {
              readModel(context).loginMethod(context);
            },
            child: const Text(
              'Login',
              style: TextStyle(color: Colors.black),
            ),
          ),
          const Spacer(flex: 20),
        ],
      ),
    );
  }
}
