import 'package:buisness_controller_verison_1/helpers/app_colors.dart';
import 'package:buisness_controller_verison_1/models/divisions_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SubdivisionCard extends StatelessWidget {
  const SubdivisionCard(
      {super.key,
      required this.name,
      required this.country,
      required this.city,
      required this.street,
      required this.id});
  final String name;
  final String country;
  final String city;
  final String street;
  final String id;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Stack(
        children: [
          Positioned(
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {},
              child: Container(
                // height: 200,
                decoration: BoxDecoration(
                  color: AppColors().appBarColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Country: $country, City: $city, Street: $street",
                      textAlign: TextAlign.center,
                    ),
                  ],
                )),
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: IconButton(
                onPressed: (() {
                  context.read<Model>().deleteSubdivision(id);
                }),
                icon: const Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 20,
                )),
          )
        ],
      ),
    );
  }
}
