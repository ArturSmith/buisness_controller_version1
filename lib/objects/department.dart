import 'package:uuid/uuid.dart';

class Company {
  Company(this.country, this.city, this.street, this.id, this.name);
  final String id;
  final String name;
  final String country;
  final String city;
  final String street;
  List<dynamic> users = [];
  List<Department> departments = [];

  void addDepartment(String country, String city, String street, String name) {
    final String generatedID = const Uuid().v4();
    final String id = '${this.id}/$generatedID';
    departments.add(Department(country, city, street, id, name));
  }

  void addUser() {}
}

class Department extends Company {
  Department(
    super.country,
    super.city,
    super.street,
    super.id,
    super.name,
  );

  List<Department> departments = [];
  List<dynamic> users = [];
  @override
  void addDepartment(String country, String city, String street, String name) {
    final String generatedID = const Uuid().v4();
    final String id = '${this.id}/$generatedID';
    departments.add(Department(country, city, street, id, name));
  }

  @override
  void addUser() {
    super.addUser();
  }
}
