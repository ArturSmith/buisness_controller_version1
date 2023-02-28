import 'package:flutter/material.dart';

class Subdivision extends StatelessWidget {
  const Subdivision(
      {super.key,
      required this.name,
      required this.country,
      required this.city,
      required this.street,
      required this.id});
  final String id;
  final String name;
  final String country;
  final String city;
  final String street;
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
