import 'package:buisness_controller_verison_1/add_views/add_subdivision_view.dart';
import 'package:buisness_controller_verison_1/models/divisions_model.dart';
import 'package:buisness_controller_verison_1/pages/company_home_page/company_home_page.dart';
import 'package:buisness_controller_verison_1/pages/login_page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Model(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        routes: {
          //pages
          '/': ((context) => const LoginPage()),
          '/CompanyHomePage': ((context) => const CompanyHomePage()),
          // add views
          '/AddSubdivisionView': ((context) => const AddSubdivisionView())
        },
        initialRoute: '/',
      ),
    );
  }
}
