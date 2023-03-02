import 'package:buisness_controller_verison_1/helpers/app_colors.dart';
import 'package:buisness_controller_verison_1/helpers/text_field_decoration.dart';
import 'package:buisness_controller_verison_1/models/department_model.dart';
import 'package:buisness_controller_verison_1/objects/department.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddDepartmentView extends StatefulWidget {
  const AddDepartmentView({super.key});

  @override
  State<AddDepartmentView> createState() => _AddDepartmentViewViewState();
}

class _AddDepartmentViewViewState extends State<AddDepartmentView> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController streetController = TextEditingController();

  String? nameError;
  String? countryError;
  String? cityError;
  String? streetError;

  Set<Department> divisions = {};

  void add() {
    final nameText = nameController.text;
    final countryText = countryController.text;
    final cityText = cityController.text;
    final streetText = streetController.text;

    nameError = nameText == '' ? 'Write name' : null;
    countryError = countryText == '' ? 'Write country' : null;
    cityError = cityText == '' ? 'Write city' : null;
    streetError = streetText == '' ? 'Write street' : null;

    if (nameText.isNotEmpty &&
        countryText.isNotEmpty &&
        cityText.isNotEmpty &&
        streetText.isNotEmpty) {
      context.read<DepartmentModel>();
      // .addDepartment(nameText, countryText, cityText, streetText);
      Navigator.pop(context);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add department'),
        centerTitle: true,
        backgroundColor: AppColors().appBarColor,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 30),
              TextField(
                controller: nameController,
                decoration: TextFieldDecoration(nameError, 'Name').decoration(),
              ),
              const Spacer(flex: 3),
              TextField(
                controller: countryController,
                decoration:
                    TextFieldDecoration(countryError, 'Country').decoration(),
              ),
              const Spacer(flex: 3),
              TextField(
                controller: cityController,
                decoration: TextFieldDecoration(cityError, 'City').decoration(),
              ),
              const Spacer(flex: 3),
              TextField(
                controller: streetController,
                decoration:
                    TextFieldDecoration(streetError, 'Street').decoration(),
              ),
              const Spacer(flex: 10),
              ElevatedButton(
                onPressed: (() {
                  add();
                }),
                style: ButtonStyle(
                    minimumSize:
                        MaterialStateProperty.all(const Size(200, 50))),
                child: const Text(
                  'Add',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const Spacer(flex: 30),
            ],
          ),
        ),
      ),
    );
  }
}
