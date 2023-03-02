import 'package:buisness_controller_verison_1/helpers/app_colors.dart';
import 'package:buisness_controller_verison_1/widgets/starting_widgets/signup_widget/signup_widget_forms.dart';
import 'package:flutter/material.dart';

class SignupWidget extends StatelessWidget {
  const SignupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Signup'),
          centerTitle: true,
          backgroundColor: AppColors().appBarColor,
        ),
        body: const SignupWidgetForms(),
      ),
    );
  }
}
