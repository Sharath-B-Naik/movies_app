import 'package:flutter/material.dart';
import 'package:movies_app/repository/api_repo.dart';
import 'package:movies_app/screens/HomePage/controller/home_controller.dart';
import 'package:movies_app/screens/HomePage/view/home_page.dart';
import 'package:movies_app/utils/app_utils.dart';
import 'package:provider/provider.dart';

class LoginController extends ChangeNotifier {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> onLoginTap(BuildContext context) async {
    final _email = emailController.text.trim();
    final _password = passwordController.text.trim();

    if (_email.isNotEmpty && _password.isNotEmpty) {
      AppUtils.showLoading(context);
      final _resp = await ApiRepo.login(_email, _password);

      if (_resp.success != null) {
        AppUtils.stopLoading(context);
        emailController.clear();
        passwordController.clear();

        context.read<HomeController>().token =
            (_resp.success!.data as Map)['token'];

        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const HomePage()),
          (_) => false,
        );
      } else {
        AppUtils.stopLoading(context);
        AppUtils.snackBar(context, _resp.failure!.message!);
      }
    } else {
      AppUtils.snackBar(context, "All fields required");
    }
  }
}
