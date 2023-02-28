import 'package:buisness_controller_verison_1/objects/subdivision.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class Model extends ChangeNotifier {
  Set<Subdivision> divisions = {};

  void addSubdivision(String name, String country, String city, String street) {
    final id = const Uuid().v4();
    final subdiv = Subdivision(
        name: name, country: country, city: city, street: street, id: id);
    divisions.add(subdiv);
    notifyListeners();
  }

  void deleteSubdivision(String id) {
    divisions.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
