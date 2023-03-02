import 'package:buisness_controller_verison_1/widgets/working_widgets/company_widget/company_widget.dart';
import 'package:flutter/cupertino.dart';

class MainModel extends ChangeNotifier {
  List<CompanyWidget> companies = [];
  List<String> logins = [];

  void addCompany(CompanyWidget company) {
    companies.add(company);
    notifyListeners();
  }

  void addLogin(String login) {
    logins.add(login);
    notifyListeners();
  }
}
