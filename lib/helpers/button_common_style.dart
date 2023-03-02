import 'package:buisness_controller_verison_1/helpers/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonCommonStyle {
  final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColors().appBarColor,
    minimumSize: const Size(200, 60),
    splashFactory: NoSplash.splashFactory,
  );
}
