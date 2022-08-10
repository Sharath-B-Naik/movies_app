import 'package:flutter/material.dart';
import 'package:movies_app/screens/HomePage/controller/home_controller.dart';
import 'package:movies_app/screens/LoginPage/controller/login_controller.dart';
import 'package:movies_app/screens/LoginPage/view/login_screen.dart';
import 'package:movies_app/screens/SignUpPage/controller/signup_controller.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(const MoviesApp());
}

class MoviesApp extends StatelessWidget {
  const MoviesApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginController()),
        ChangeNotifierProvider(create: (context) => SignupController()),
        ChangeNotifierProvider(create: (context) => HomeController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primaryColor: Colors.orange),
        home: const LoginPage(),
      ),
    );
  }
}
