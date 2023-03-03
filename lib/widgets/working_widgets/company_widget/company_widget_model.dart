import 'package:flutter/cupertino.dart';

import '../department_widget/department_widget.dart';

class CompanyWidgetModel extends ChangeNotifier {
  String name = '';
  String country = '';
  String city = '';
  String street = '';
  String id = '';
  List<DepartmentWidget> departments = [];
  List<dynamic> users = [];
}
