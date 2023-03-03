import 'package:buisness_controller_verison_1/helpers/app_colors.dart';
import 'package:buisness_controller_verison_1/helpers/button_common_style.dart';
import 'package:buisness_controller_verison_1/helpers/text_field_decoration.dart';

import 'package:buisness_controller_verison_1/views/add_department_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddDepartmentView extends StatelessWidget {
  const AddDepartmentView({super.key, required this.parentID});
  final String parentID;

  void setDataToModel(BuildContext context) {
    context.read<AddDepartmentViewModel>().parentID = parentID;
  }

  AddDepartmentViewModel readModel(BuildContext context) {
    return context.read<AddDepartmentViewModel>();
  }

  AddDepartmentViewModel watchModel(BuildContext context) {
    return context.watch<AddDepartmentViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    setDataToModel(context);
    return Scaffold(
      drawer: Drawer(
        width: MediaQuery.of(context).size.width / 1.5,
      ),
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
                onChanged: (value) {
                  readModel(context).checkName(context, value);
                },
                decoration:
                    TextFieldDecoration(watchModel(context).errorName, 'Name')
                        .decoration(),
              ),
              const Spacer(flex: 3),
              TextField(
                onChanged: (value) {
                  readModel(context).country = value;
                },
                decoration: TextFieldDecoration(null, 'Country (not required)')
                    .decoration(),
              ),
              const Spacer(flex: 3),
              TextField(
                onChanged: (value) {
                  readModel(context).city = value;
                },
                decoration: TextFieldDecoration(null, 'City (not required)')
                    .decoration(),
              ),
              const Spacer(flex: 3),
              TextField(
                onChanged: (value) {
                  readModel(context).street = value;
                },
                decoration: TextFieldDecoration(null, 'Street (not required)')
                    .decoration(),
              ),
              const Spacer(flex: 10),
              ElevatedButton(
                onPressed: (() {
                  readModel(context).add(context);
                }),
                style: ButtonCommonStyle().buttonStyle,
                child: const Text(
                  'Add',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              const Spacer(flex: 20),
              IconButton(
                  onPressed: (() {
                    Navigator.of(context).pop();
                  }),
                  icon: const Icon(Icons.arrow_back)),
              const Spacer(flex: 4),
            ],
          ),
        ),
      ),
    );
  }
}
