import 'package:buisness_controller_verison_1/helpers/routes.dart';
import 'package:buisness_controller_verison_1/models/main_model.dart';
import 'package:buisness_controller_verison_1/views/add_department_view_model.dart';
import 'package:buisness_controller_verison_1/widgets/starting_widgets/login_widget/login_widget_model.dart';
import 'package:buisness_controller_verison_1/widgets/starting_widgets/signup_widget/signup_widget_model.dart';
import 'package:buisness_controller_verison_1/widgets/working_widgets/company_widget/company_widget_model.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => MainModel()),
        ChangeNotifierProvider(create: (context) => CompanyWidgetModel()),
        ChangeNotifierProvider(create: (context) => SignupWidgetModel()),
        ChangeNotifierProvider(create: (context) => LoginWidgetModel()),
        ChangeNotifierProvider(create: ((context) => AddDepartmentViewModel()))
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
