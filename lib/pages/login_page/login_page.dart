import 'package:buisness_controller_verison_1/helpers/app_colors.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        title: const Text('Login'),
        centerTitle: true,
        backgroundColor: AppColors().appBarColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: (() {
                Navigator.of(context).pushReplacementNamed('/CompanyHomePage');
              }),
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(const Size(200, 60))),
              child: const Text(
                'Login',
                style: TextStyle(color: Colors.black),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                style: ButtonStyle(
                    minimumSize:
                        MaterialStateProperty.all(const Size(200, 60))),
                onPressed: (() {}),
                child: const Text(
                  'Signup',
                  style: TextStyle(color: Colors.black),
                )),
          ],
        ),
      ),
    );
  }
}
