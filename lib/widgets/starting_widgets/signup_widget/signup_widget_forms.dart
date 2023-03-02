import 'package:buisness_controller_verison_1/helpers/button_common_style.dart';
import 'package:buisness_controller_verison_1/helpers/text_field_decoration.dart';
import 'package:flutter/material.dart';

import 'signup_widget_forms_second.dart';

class SignupWidgetForms extends StatefulWidget {
  const SignupWidgetForms({super.key});

  @override
  State<SignupWidgetForms> createState() => _SignupWidgetFormsState();
}

class _SignupWidgetFormsState extends State<SignupWidgetForms> {
  final TextEditingController nameCont = TextEditingController();
  final TextEditingController countryCont = TextEditingController();
  final TextEditingController cityCont = TextEditingController();
  final TextEditingController streetCont = TextEditingController();

  String? errorName, errorCountry, errorCity, errorStreet;

  void next() {
    final nameText = nameCont.text;
    final countryText = countryCont.text;
    final cityText = cityCont.text;
    final streetText = streetCont.text;

    errorName = nameText == '' ? 'Write name' : null;
    errorCountry = countryText == '' ? 'Write country' : null;
    errorCity = cityText == '' ? 'Write city' : null;
    errorStreet = streetText == '' ? 'Write street' : null;

    if (nameText.isNotEmpty &&
        countryText.isNotEmpty &&
        cityText.isNotEmpty &&
        streetText.isNotEmpty) {
      Navigator.of(context).push(
        MaterialPageRoute(
            builder: (context) => SignupWidgetFormsSecond(
                name: nameText,
                country: countryText,
                city: cityText,
                street: streetText)),
      );
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
            controller: nameCont,
            decoration:
                TextFieldDecoration(errorName, 'Name of company').decoration(),
          ),
          const Spacer(flex: 3),
          TextField(
            controller: countryCont,
            decoration:
                TextFieldDecoration(errorCountry, 'Country').decoration(),
          ),
          const Spacer(flex: 3),
          TextField(
            controller: cityCont,
            decoration: TextFieldDecoration(errorCity, 'City').decoration(),
          ),
          const Spacer(flex: 3),
          TextField(
            controller: streetCont,
            decoration: TextFieldDecoration(errorStreet, 'Street').decoration(),
          ),
          const Spacer(flex: 3),
          ElevatedButton(
              style: ButtonCommonStyle().buttonStyle,
              onPressed: (() {
                next();
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
