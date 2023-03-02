import 'package:buisness_controller_verison_1/helpers/button_common_style.dart';
import 'package:buisness_controller_verison_1/helpers/text_field_decoration.dart';
import 'package:buisness_controller_verison_1/widgets/starting_widgets/signup_widget/signup_widget_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignupWidgetForms extends StatefulWidget {
  const SignupWidgetForms({super.key});

  @override
  State<SignupWidgetForms> createState() => _SignupWidgetFormsState();
}

class _SignupWidgetFormsState extends State<SignupWidgetForms> {
  String? errorName, errorCountry, errorCity, errorStreet;

  SignupWidgetModel readModel(BuildContext context) {
    return context.read<SignupWidgetModel>();
  }

  SignupWidgetModel watchModel(BuildContext context) {
    return context.watch<SignupWidgetModel>();
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
              readModel(context).name = value;
            },
            decoration: TextFieldDecoration(
                    watchModel(context).errorName, 'Name of company')
                .decoration(),
          ),
          const Spacer(flex: 3),
          TextField(
            onChanged: ((value) {
              readModel(context).country = value;
            }),
            decoration:
                TextFieldDecoration(watchModel(context).errorCountry, 'Country')
                    .decoration(),
          ),
          const Spacer(flex: 3),
          TextField(
            onChanged: ((value) {
              readModel(context).city = value;
            }),
            decoration:
                TextFieldDecoration(watchModel(context).errorCity, 'City')
                    .decoration(),
          ),
          const Spacer(flex: 3),
          TextField(
            onChanged: (value) {
              readModel(context).street = value;
            },
            decoration:
                TextFieldDecoration(watchModel(context).errorStreet, 'Street')
                    .decoration(),
          ),
          const Spacer(flex: 3),
          ElevatedButton(
              style: ButtonCommonStyle().buttonStyle,
              onPressed: (() {
                readModel(context).next(context);
              }),
              child: const Text(
                'Next',
                style: TextStyle(color: Colors.black),
              )),
          const Spacer(flex: 20)
        ],
      ),
    );
  }
}
