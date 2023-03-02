import 'package:buisness_controller_verison_1/helpers/routes.dart';
import 'package:buisness_controller_verison_1/models/main_model.dart';
import 'package:buisness_controller_verison_1/models/department_model.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainModel()),
        ChangeNotifierProvider(create: (context) => DepartmentModel()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        routes: Routes().routes,
        initialRoute: '/',
      ),
    );
  }
}
