import 'package:buisness_controller_verison_1/models/department_model.dart';
import 'package:buisness_controller_verison_1/objects/department.dart';
import 'package:buisness_controller_verison_1/views/department_card_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompanyWidgetBody extends StatelessWidget {
  const CompanyWidgetBody({super.key});

  Set<DepartmentCardView> getListOfDivisions(Set<Department> divisions) {
    Set<DepartmentCardView> departmentCards = {};

    if (divisions.isNotEmpty) {
      for (var element in divisions) {
        departmentCards.add(DepartmentCardView(
          name: element.name,
          country: element.country,
          city: element.city,
          street: element.street,
          id: element.id,
        ));
      }
    }

    return departmentCards;
  }

  @override
  Widget build(BuildContext context) {
    final listOfDepartments =
        getListOfDivisions(context.watch<DepartmentModel>().departments);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) =>
            const DepartmentCardView(
                name: 'Fenix',
                country: 'Russia',
                city: 'Moscow',
                street: 'Pushkina',
                id: '23423123'),
        itemCount: 10,
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(height: 10),
      ),
    );
  }
}
