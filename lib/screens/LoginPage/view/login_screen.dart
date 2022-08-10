import 'package:flutter/material.dart';
import 'package:movies_app/screens/LoginPage/controller/login_controller.dart';
import 'package:movies_app/screens/SignUpPage/view/signup_screen.dart';
import 'package:movies_app/widgets/app_button.dart';
import 'package:movies_app/widgets/app_textfield.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _provider = context.read<LoginController>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.orange.shade900,
                Colors.orange.shade400,
              ],
            ),
          ),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            margin: const EdgeInsets.only(top: 150),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 50),
                const Text(
                  "Signin",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 50),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.orange.shade100,
                        offset: const Offset(5, 8),
                        blurRadius: 50,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      AppTextField(
                        controller: _provider.emailController,
                        hintText: "Email",
                      ),
                      const Divider(height: 0),
                      AppTextField(
                        controller: _provider.passwordController,
                        hintText: "Password",
                        isPassword: true,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                AppButton(
                  text: "Signin",
                  onTap: () => _provider.onLoginTap(context),
                ),
                const SizedBox(height: 40),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (builder) => const SignupPage(),
                        ),
                      );
                    },
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(
                        Colors.transparent,
                      ),
                    ),
                    child: const Text(
                      "Not have an account ? Signup",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
