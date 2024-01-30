import 'package:flutter/material.dart';
import 'package:dating_provider_pattern/routes/app_route.dart';
import 'package:dating_provider_pattern/utils/app_images.dart';
import 'package:dating_provider_pattern/utils/colors.dart';
import 'package:dating_provider_pattern/utils/constants.dart';
import 'package:dating_provider_pattern/utils/secure_storage.dart';

import '../../config/app_fonts.dart';
import '../../config/size_config.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    getInitialData();
    super.initState();
  }

  Future<void> getInitialData() async {
    Future.delayed(Duration(milliseconds: 3500)).then((value) {
      Navigator.pushNamedAndRemoveUntil(context, AppRoute.loginRoute, (route) => false);
    });
    // bool isFirstTime = await StorageService().isFirstTime();
    // print("IsFirstTime>>>>" + isFirstTime.toString());
    //
    // if (!isFirstTime) {
    //   String? userId = await StorageService().readSecureData(Constants.userId);
    //   if (userId != null) {
    //     Future.delayed(Duration(milliseconds: 3500)).then((value) {
    //       Navigator.pushNamedAndRemoveUntil(
    //           context, AppRoute.homePageRoute, (route) => false);
    //     });
    //   } else {
    //     Future.delayed(Duration(milliseconds: 3500)).then((value) {
    //       Navigator.pushNamedAndRemoveUntil(
    //           context, AppRoute.loginRoute, (route) => false);
    //     });
    //   }
    // } else {
    //   Future.delayed(Duration(milliseconds: 3500)).then((value) {
    //     Navigator.pushNamedAndRemoveUntil(
    //         context, AppRoute.welcomePageRoute, (route) => false);
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xffff4350),
            Color(0xfff5347f),
            Color(0xffbf00ff),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        padding: EdgeInsets.only(
          left: getProportionateScreenWidth(42),
          right: getProportionateScreenWidth(42),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Spacer(),
            Image.asset(AppImages.appLogo),
            SizedBox(
              height: getProportionateScreenHeight(18),
            ),
            Text(
              "Syndeo",
              style: TextStyle(
                color: Colors.white,
                fontFamily: AppFonts.fontRecoletaSemiBold,
                fontSize: getProportionalFontSize(32),
              ),
            ),
            Spacer(),
            Padding(
              padding: EdgeInsets.only(
                bottom: getProportionateScreenHeight(82),
              ),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(children: [
                  TextSpan(
                    text: "WELCOME TO ",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: AppFonts.fontMedium,
                      fontSize: getProportionalFontSize(14),
                    ),
                  ),
                  TextSpan(
                    text: "SYNDEO\n",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: AppFonts.fontBold,
                      fontSize: getProportionalFontSize(14),
                    ),
                  ),
                  TextSpan(
                    text: "THE APP FOR LIKE MINDED PEOPLE",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: AppFonts.fontMedium,
                      fontSize: getProportionalFontSize(14),
                    ),
                  )
                ]),
              ),
              // child: Text(
              //   "Welcome to Neuropal The app for like minded people"
              //       .toUpperCase(),
              //   textAlign: TextAlign.center,
              //   style: TextStyle(color: Colors.white),
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
