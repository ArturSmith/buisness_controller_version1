import 'package:buisness_controller_verison_1/helpers/app_colors.dart';
import 'package:buisness_controller_verison_1/views/add_department_view.dart';
import 'package:buisness_controller_verison_1/widgets/working_widgets/company_widget/company_widget_body.dart';
import 'package:buisness_controller_verison_1/widgets/working_widgets/company_widget/company_widget_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';
import '../department_widget/department_widget.dart';

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

  List<DepartmentWidget> departments = [];
  List<dynamic> users = [];

  void saveDataInModel(BuildContext context) {
    final model = context.read<CompanyWidgetModel>();
    model.name = name;
    model.country = country;
    model.city = city;
    model.street = street;
    model.id = id;
    model.departments = departments;
    model.users = users;
  }

  void addDepartment(BuildContext context, DepartmentWidget department) {
    context.read<CompanyWidgetModel>().departments.add(department);
  }

  CompanyWidgetModel readModel(BuildContext context) {
    return context.read<CompanyWidgetModel>();
  }

  CompanyWidgetModel watchModel(BuildContext context) {
    return context.watch<CompanyWidgetModel>();
  }

  @override
  Widget build(BuildContext context) {
    saveDataInModel(context);
    return Scaffold(
      drawer: Drawer(),
      backgroundColor: AppColors().appBackgroundColor,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: (() {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => AddDepartmentView(parentID: id)));
              }),
              icon: const Icon(Icons.add_business_outlined)),
          IconButton(
            onPressed: (() {}),
            icon: const Icon(Icons.person_add),
          )
        ],
        backgroundColor: AppColors().appBarColor,
        title: Text(watchModel(context).name),
        centerTitle: true,
      ),
      body: const CompanyWidgetBody(),
    );
  }
}
