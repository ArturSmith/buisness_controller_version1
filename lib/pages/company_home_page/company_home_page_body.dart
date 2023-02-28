import 'package:buisness_controller_verison_1/models/divisions_model.dart';
import 'package:buisness_controller_verison_1/objects/subdivision.dart';
import 'package:buisness_controller_verison_1/pages/company_home_page/subdivision_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CompanyHomePageBody extends StatelessWidget {
  const CompanyHomePageBody({super.key});

  Set<SubdivisionCard> getListOfDivisions(Set<Subdivision> divisions) {
    Set<SubdivisionCard> divisionCards = {};

    if (divisions.isNotEmpty) {
      for (var element in divisions) {
        divisionCards.add(SubdivisionCard(
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
        final height = constraints.maxHeight;
        double width = constraints.maxWidth;
        int count = 1;

        if (width < 400) {
          count = 1;
        } else if (width > 400 && width < 800) {
          count = 2;
        } else if (width > 800) {
          count = 3;
        }
        return GridView.count(
          crossAxisCount: width < 400 ? 1 : 2,
          children: [...getListOfDivisions(context.watch<Model>().divisions)],
        );
      }),
    );
  }
}
