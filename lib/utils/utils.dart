import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dating_provider_pattern/config/app_fonts.dart';

// import 'package:permission_handler/permission_handler.dart';

import '../config/size_config.dart';
import 'colors.dart';

class Utils {
  Utils._();

  static bool _loaderActive = false;

  static void showLoader(BuildContext context) {
    if (!_loaderActive) {
      _loaderActive = true;
      showGeneralDialog(
          context: context,
          barrierDismissible: false,
          barrierColor: Colors.black45,
          pageBuilder: (context, animation1, animation2) => Center(
                child: SizedBox(
                    height: SizeConfig.deviceHeight,
                    width: SizeConfig.deviceWidth,
                    child: Platform.isAndroid
                        ? const Center(
                            child: CircularProgressIndicator(
                                color: AppColors.primaryColor))
                        : const CupertinoActivityIndicator(
                            color: Colors.white,
                            radius: 25,
                          )),
              ));
    }
  }

  static hideLoader(BuildContext context) {
    if (_loaderActive) {
      _loaderActive = false;
      Navigator.pop(context);
    }
  }


  static showToast(String message) {
    Fluttertoast.showToast(
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_SHORT,
        textColor: Colors.white,
        backgroundColor: AppColors.primaryColor,
        msg: message);
  }


  static showCustomDialog(
      {required context,
      required title,
      bool? bar,
      required description,
      required buttons}) {
    showDialog(
        context: context,
        barrierDismissible: bar ?? false,
        builder: (context) => CupertinoAlertDialog(
              title: Text(
                title,
                style: TextStyle(
                  fontFamily: AppFonts.fontSemiBold,
                  fontSize: getProportionalFontSize(16),
                ),
              ),
              content: Text(
                description,
                style: TextStyle(
                  fontFamily: AppFonts.fontRegular,
                  fontSize: getProportionalFontSize(14),
                ),
              ),
              actions: buttons,
            ));
  }

}