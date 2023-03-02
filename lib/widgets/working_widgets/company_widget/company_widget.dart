import 'package:buisness_controller_verison_1/helpers/app_colors.dart';
import 'package:buisness_controller_verison_1/widgets/working_widgets/company_widget/company_widget_body.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class CompanyWidget extends StatelessWidget {
  CompanyWidget(
      {super.key,
      required this.name,
      required this.country,
      required this.city,
      required this.street,
      required this.login,
      required this.password});

  final String name;
  final String country;
  final String city;
  final String street;
  final String login;
  final String password;
  final String id = const Uuid().v4();
  List<dynamic> departments = [];
  List<dynamic> users = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors().appBackgroundColor,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (() {
                Navigator.of(context).pushNamed('/AddDepartmentView');
              }),
              icon: const Icon(Icons.add_business_outlined)),
          IconButton(
            onPressed: (() {}),
            icon: const Icon(Icons.person_add),
          )
        ],
        backgroundColor: AppColors().appBarColor,
        title: Text(name),
        centerTitle: true,
      ),
      body: const CompanyWidgetBody(),
    );
  }
}
