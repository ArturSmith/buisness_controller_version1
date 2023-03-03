import 'package:buisness_controller_verison_1/widgets/working_widgets/company_widget/company_widget_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../widgets/working_widgets/department_widget/department_widget.dart';

class AddDepartmentViewModel extends ChangeNotifier {
  String parentID = '';
  String name = '';
  String? country;
  String? city;
  String? street;
  String? errorName;

  void checkName(BuildContext context, String value) {
    name = value;

    errorName = null;
    notifyListeners();
  }

  void add(BuildContext context) {
    if (name.isEmpty) {
      errorName = 'Write name';
    } else {
      errorName = null;

      final DepartmentWidget department = DepartmentWidget(
          parentID: parentID,
          name: name,
          country: country,
          city: city,
          streeet: street);

      final companyModel = context.read<CompanyWidgetModel>();

      if (companyModel.id == parentID) {
        companyModel.departments.add(department);
        Navigator.of(context).pop();
      } else {
        final DepartmentWidget parentDepartment = companyModel.departments
            .singleWhere((element) => element.id == parentID);
        // call addDepartment method from that department
        // navigator.pop()
      }
    }
    notifyListeners();
  }
}
