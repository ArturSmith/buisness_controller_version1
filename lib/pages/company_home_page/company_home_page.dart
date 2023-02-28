import 'package:buisness_controller_verison_1/helpers/app_colors.dart';
import 'package:buisness_controller_verison_1/pages/company_home_page/company_home_page_body.dart';
import 'package:flutter/material.dart';

class CompanyHomePage extends StatelessWidget {
  const CompanyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors().appBarColor,
        title: const Text("Company 'Diknus'"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors().appBarColor,
        elevation: 20,
        onPressed: () {
          Navigator.of(context).pushNamed('/AddSubdivisionView');
        },
        child: const Icon(
          Icons.add,
          color: Colors.black,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: const CompanyHomePageBody(),
    );
  }
}
