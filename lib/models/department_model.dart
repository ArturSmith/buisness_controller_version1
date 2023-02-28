import 'package:buisness_controller_verison_1/objects/department.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class DepartmentModel extends ChangeNotifier {
  Set<Department> divisions = {};

  void addSubdivision(String name, String country, String city, String street) {
    final id = const Uuid().v4();
    final subdiv = Department(id, name, country, city, street);
    divisions.add(subdiv);
    notifyListeners();
  }

  void deleteSubdivision(String id) {
    divisions.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
