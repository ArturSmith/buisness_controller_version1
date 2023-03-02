import 'package:buisness_controller_verison_1/objects/department.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class DepartmentModel extends ChangeNotifier {
  Set<Department> departments = {};

  void addDepartment(String name, String country, String city, String street,
      List<dynamic> users) {
    final id = const Uuid().v4();
    final subdiv = Department(country, city, street, id, name);
    departments.add(subdiv);
    notifyListeners();
  }

  void deleteDepartment(String id) {
    departments.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
