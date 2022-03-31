import 'package:ducmn/view/login.dart';
import 'package:ducmn/view/register.dart';
import 'package:flutter/cupertino.dart';

class Routes{
  Routes._();

  static const String login = '/login';
  static const String register = '/register';
  static const String sign = '/sign';
  static final routes = <String, WidgetBuilder>{
    login: (BuildContext context) => const LoginScreen(),
    register :(BuildContext context) => const RegisterScreen(),
  };
}