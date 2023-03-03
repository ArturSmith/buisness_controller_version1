import 'package:flutter/material.dart';

class DepartmentWidget extends StatelessWidget {
  const DepartmentWidget(
      {super.key,
      required this.parentID,
      required this.name,
      this.country,
      this.city,
      this.streeet});
  final String parentID;
  final String name;
  final String? country;
  final String? city;
  final String? streeet;

  final String id = '';

  void setDataToModel() {}
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
