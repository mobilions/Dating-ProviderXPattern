import 'package:dating_provider_pattern/modules/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';

import '../modules/login/login_screen.dart';
import '../modules/login/login_with_email_screen.dart';
import '../modules/registration/registration_screen.dart';
import '../modules/splash/splash_screen.dart';


class AppRoute {
  static const String splashRoute = "/";
  static const String loginRoute = "/login";
  static const String loginWithEmailRoute = "/loginWithEmail";
  static const String createAccRoute = "/createAcc";
  static const String dashBoardPageRoute = "/dashBoardPage";
  static const String welcomePageRoute = "/welcomePage";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case loginWithEmailRoute:
        return MaterialPageRoute(builder: (_) => const LogInWithEmailScreen());
      //
      case createAccRoute:
        return MaterialPageRoute(builder: (_) => const RegistrationScreen());
      //
      case dashBoardPageRoute:
        return MaterialPageRoute(builder: (_) => const DashBoardScreen());

      //
      // case subscriptionRoute:
      //    bool  isSubscribed = settings.arguments as bool;
      //    bool isF = settings.arguments as bool ;
      //   return MaterialPageRoute(builder: (_) =>  SubscriptionScreen(isSubscribed: isSubscribed,isFromMeetingList: isF,));
      //
      // case inAppPurchaseRoute:
      //   return MaterialPageRoute(builder: (_) =>  InAppPurchaseScreen(subscriptionModel: SubscriptionModel(),));

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}
