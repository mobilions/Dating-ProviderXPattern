import 'dart:io';

import 'package:cross_file/src/types/interface.dart';
import 'package:flutter/widgets.dart';

class LoginProvider extends ChangeNotifier{

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController=>_emailController;

  TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController=>_passwordController;

  bool _isObscure = true;
  bool get isObscure=>_isObscure;

}