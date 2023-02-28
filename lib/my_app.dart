import 'package:buisness_controller_verison_1/views/add_department_view.dart';
import 'package:buisness_controller_verison_1/models/department_model.dart';
import 'package:buisness_controller_verison_1/pages/working_pages/company_home_page/company_home_page.dart';
import 'package:buisness_controller_verison_1/pages/starting_pages/first_page/first_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DepartmentModel(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        routes: {
          //pages
          '/': ((context) => const FirstPage()),
          '/CompanyHomePage': ((context) => const CompanyHomePage()),
          // add views
          '/AddSubdivisionView': ((context) => const AddDepartmentView())
        },
        initialRoute: '/',
      ),
    );
  }
}
