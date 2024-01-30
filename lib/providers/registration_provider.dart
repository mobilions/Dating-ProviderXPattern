import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class RegistrationProvider extends ChangeNotifier{

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController=>_emailController;

  TextEditingController _passwordController = TextEditingController();
  TextEditingController get passwordController=>_passwordController;

  TextEditingController _fullNameController = TextEditingController();
  TextEditingController get fullNameController=>_fullNameController;

  TextEditingController _ageController = TextEditingController();
  TextEditingController get ageController=>_ageController;

  bool _isObscure = true;
  bool get isObscure=>_isObscure;

  File? _imageFile;
  File? get imageFile=> _imageFile;

  void updateImageFile(XFile file) {
    _imageFile = File(file.path);
    notifyListeners();
  }
}