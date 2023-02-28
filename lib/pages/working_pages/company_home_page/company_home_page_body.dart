import 'package:buisness_controller_verison_1/models/department_model.dart';
import 'package:buisness_controller_verison_1/objects/department.dart';
import 'package:buisness_controller_verison_1/pages/working_pages/company_home_page/department_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompanyHomePageBody extends StatelessWidget {
  const CompanyHomePageBody({super.key});

  Set<DepartmentCard> getListOfDivisions(Set<Department> divisions) {
    Set<DepartmentCard> divisionCards = {};

    if (divisions.isNotEmpty) {
      for (var element in divisions) {
        divisionCards.add(DepartmentCard(
            name: element.name,
            country: element.country,
            city: element.city,
            street: element.street,
            id: element.id));
      }
    }

    return divisionCards;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
        double width = constraints.maxWidth;

        return GridView.count(
          crossAxisCount: width < 500 ? 1 : 2,
          children: [
            ...getListOfDivisions(context.watch<DepartmentModel>().divisions)
          ],
        );
      }),
    );
  }
}
