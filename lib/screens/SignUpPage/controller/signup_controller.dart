import 'package:flutter/material.dart';
import 'package:movies_app/repository/api_repo.dart';
import 'package:movies_app/screens/LoginPage/view/login_screen.dart';
import 'package:movies_app/utils/app_utils.dart';

class SignupController extends ChangeNotifier {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> onSignUpTap(BuildContext context) async {
    final _firstName = firstNameController.text.trim();
    final _lastName = lastNameController.text.trim();
    final _email = emailController.text.trim();
    final _password = passwordController.text.trim();

    if (_firstName.isNotEmpty &&
        _lastName.isNotEmpty &&
        _email.isNotEmpty &&
        _password.isNotEmpty) {
      AppUtils.showLoading(context);
      final _resp = await ApiRepo.signup(
        _firstName,
        _lastName,
        _email,
        _password,
      );

      if (_resp.success != null) {
        AppUtils.stopLoading(context);
        firstNameController.clear();
        lastNameController.clear();
        emailController.clear();
        passwordController.clear();

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const LoginPage()),
          (_) => false,
        );
      } else {
        AppUtils.stopLoading(context);
        AppUtils.snackBar(context, 'Something went wrong');
      }
    } else {
      AppUtils.snackBar(context, "All fields required");
    }
  }
}
