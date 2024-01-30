import 'package:dating_provider_pattern/providers/dashboard_provider.dart';
import 'package:dating_provider_pattern/providers/login_provider.dart';
import 'package:dating_provider_pattern/providers/registration_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:dating_provider_pattern/config/size_config.dart';
import 'package:dating_provider_pattern/routes/app_route.dart';
import 'package:provider/provider.dart';


Future<void> main() async {
  runApp(const MyApp());
}

GlobalKey<NavigatorState> navState = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => DashBoardProvider(),),
      ChangeNotifierProvider(create: (context) => LoginProvider(),),
      ChangeNotifierProvider(create: (context) => RegistrationProvider(),),
    ],child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
        appBarTheme: AppBarTheme(
            surfaceTintColor: Colors.transparent,
            iconTheme: IconThemeData(
              color: Colors.white,
            ),
            actionsIconTheme: IconThemeData(
              color: Colors.white,
            ),
            backgroundColor: Colors.white),
      ),
      title: 'Syndeeo',
      navigatorKey: navState,
      onGenerateRoute: (settings) => AppRoute.generateRoute(settings),
      initialRoute: AppRoute.splashRoute,
    ),);
  }
}
