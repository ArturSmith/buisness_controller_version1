import 'package:buisness_controller_verison_1/helpers/app_colors.dart';
import 'package:buisness_controller_verison_1/helpers/button_common_style.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 20),
              ElevatedButton(
                onPressed: (() {
                  Navigator.of(context).pushNamed("/LoginWidget");
                }),
                style: ButtonCommonStyle().buttonStyle,
                child: const Text(
                  'Login',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const Spacer(flex: 3),
              ElevatedButton(
                style: ButtonCommonStyle().buttonStyle,
                onPressed: (() {
                  Navigator.pushNamed(context, '/SignupWidget');
                }),
                child: const Text(
                  'Signup',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const Spacer(flex: 3),
              ElevatedButton(
                style: ButtonCommonStyle().buttonStyle,
                onPressed: (() {
                  // Navigator.pushNamed(context, '/SignupWidget');
                }),
                child: const Text(
                  'Join',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const Spacer(flex: 20),
            ],
          ),
        ),
      ),
    );
  }
}
