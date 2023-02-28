import 'package:buisness_controller_verison_1/helpers/app_colors.dart';
import 'package:buisness_controller_verison_1/models/department_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DepartmentCard extends StatefulWidget {
  const DepartmentCard(
      {super.key,
      required this.name,
      required this.country,
      required this.city,
      required this.street,
      required this.id});
  final String name;
  final String? country;
  final String city;
  final String street;
  final String id;

  @override
  State<DepartmentCard> createState() => _SubdivisionCardState();
}

class _SubdivisionCardState extends State<DepartmentCard> {
  bool deleting = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      elevation: 15,
      clipBehavior: Clip.hardEdge,
      child: Stack(
        children: [
          Positioned(
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors().appBarColor,
                ),
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.name,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "Country: ${widget.country}, City: ${widget.city}, Street: ${widget.street}",
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
                  deleting = true;
                  setState(() {});
                }),
                icon: const Icon(
                  Icons.delete,
                  color: Colors.white,
                  size: 20,
                )),
          ),
          deleting
              ? Positioned.fill(
                  child: Opacity(
                    opacity: 0.5,
                    child: Container(
                      color: Colors.black,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.white,
                              size: 50,
                            ),
                            onPressed: (() {
                              context
                                  .read<DepartmentModel>()
                                  .deleteSubdivision(widget.id);
                            }),
                          ),
                          IconButton(
                              onPressed: (() {
                                deleting = false;
                                setState(() {});
                              }),
                              icon: const Icon(
                                Icons.cancel_outlined,
                                color: Colors.white,
                                size: 30,
                              ))
                        ],
                      ),
                    ),
                  ),
                )
              : const Center()
        ],
      ),
    );
  }
}
