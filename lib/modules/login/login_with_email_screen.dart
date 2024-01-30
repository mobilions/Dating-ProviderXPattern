import 'package:dating_provider_pattern/providers/login_provider.dart';
import 'package:dating_provider_pattern/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/app_fonts.dart';
import '../../config/size_config.dart';
import '../../utils/app_images.dart';
import '../../widgets/common_button.dart';
import '../../widgets/common_textfield.dart';

class LogInWithEmailScreen extends StatelessWidget {
  const LogInWithEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Consumer<LoginProvider>(builder: (context, value, child) {
        return Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(71),
                        vertical: getProportionateScreenHeight(50),
                      ),
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(152),
                        ),
                        gradient: LinearGradient(colors: [
                          Color(0xffff4350),
                          Color(0xfff5347f),
                          Color(0xffbf00ff),
                        ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                      ),
                      child: Column(
                        children: [
                          Image.asset(AppImages.appLogo),
                          Text(
                            "Syndeo",
                            style: TextStyle(
                              fontSize: getProportionalFontSize(24),
                              fontFamily: AppFonts.fontRecoletaSemiBold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(14),
                          ),
                          Text(
                            "The app for like minded people".toUpperCase(),
                            style: TextStyle(
                              fontSize: getProportionalFontSize(12),
                              fontFamily: AppFonts.fontSemiBold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: getProportionateScreenWidth(30),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: getProportionateScreenHeight(55),
                          ),
                          CommonTextField(
                            title: "Email Address",
                            hintText: "eg: john@gmail.com",
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(24),
                          ),
                          CommonTextField(
                            title: "Password",
                            hintText: "*******",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            CommonButton(
              margin: EdgeInsets.symmetric(
                horizontal: getProportionateScreenWidth(30),
                vertical: getProportionateScreenHeight(32),
              ),
              text: "Sign In",
              onPresses: () {
                Navigator.pushNamedAndRemoveUntil(context, AppRoute.dashBoardPageRoute, (route) => false);
              },
            ),
          ],
        );
      },),
    );
  }
}
