import 'package:buisness_controller_verison_1/helpers/app_colors.dart';
import 'package:flutter/material.dart';

import 'login_widget_forms.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors().appBarColor,
            title: const Text('Login'),
            centerTitle: true,
          ),
          body: const LoginWidgetForms()),
    );
  }
}
