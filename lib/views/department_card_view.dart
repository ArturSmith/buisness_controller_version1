import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class DepartmentCardView extends StatefulWidget {
  const DepartmentCardView(
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
  State<DepartmentCardView> createState() => _DepartmentCardState();
}

class _DepartmentCardState extends State<DepartmentCardView> {
  void delete() {}

  void showStructure() {}
  @override
  Widget build(BuildContext context) {
    return Slidable(
      startActionPane: ActionPane(
        motion: const BehindMotion(),
        children: [
          SlidableAction(
            flex: 1,
            spacing: 1,
            onPressed: ((context) {
              delete();
            }),
            icon: Icons.delete,
            label: "Delete",
          ),
          SlidableAction(
            onPressed: ((context) {
              showStructure();
            }),
            flex: 1,
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(10),
                bottomRight: Radius.circular(10)),
            icon: Icons.remove_red_eye_outlined,
            label: 'Structure',
          )
        ],
      ),
      child: Card(
        elevation: 10,
        margin: const EdgeInsets.symmetric(horizontal: 7),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.all(10),
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style:
                    const TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
              Text(
                'Address: ${widget.country}, ${widget.city}, ${widget.street}',
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
