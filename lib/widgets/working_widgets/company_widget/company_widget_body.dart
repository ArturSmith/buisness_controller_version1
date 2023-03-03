import 'package:flutter/material.dart';

import '../department_widget/department_widget_card.dart';

class CompanyWidgetBody extends StatelessWidget {
  const CompanyWidgetBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListView.separated(
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) =>
            const DepartmentWidgetCard(
                name: 'Fenix',
                country: 'Russia',
                city: 'Moscow',
                street: 'Pushkina',
                id: '23423123'),
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(height: 10),
      ),
    );
  }
}
