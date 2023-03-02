import 'package:buisness_controller_verison_1/widgets/starting_widgets/signup_widget/signup_widget.dart';
import '../views/add_department_view.dart';
import '../widgets/starting_widgets/first_page/first_page.dart';
import '../widgets/starting_widgets/login_widget/login_widget.dart';

class Routes {
  final routes = {
    //pages
    '/': ((context) => const FirstPage()),
    '/LoginWidget': ((context) => const LoginWidget()),
    '/SignupWidget': ((context) => const SignupWidget()),

    // add views
    '/AddDepartmentView': ((context) => const AddDepartmentView())
  };
}
