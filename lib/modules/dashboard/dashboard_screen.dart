import 'package:dating_provider_pattern/providers/dashboard_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dating_provider_pattern/config/app_fonts.dart';
import 'package:dating_provider_pattern/config/size_config.dart';
import 'package:dating_provider_pattern/dependencies/advanced_drawer/flutter_advanced_drawer.dart';
import 'package:dating_provider_pattern/utils/app_images.dart';
import 'package:dating_provider_pattern/utils/colors.dart';
import 'package:provider/provider.dart';

import '../../utils/utils.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: 
      Consumer<DashBoardProvider>(builder: (context, dashBoardProvider, child) {
        return PopScope(
          canPop: dashBoardProvider.canPop,
          onPopInvoked: (didPop) {
            dashBoardProvider.onPopInvoked();
          },
          child: Scaffold(
            bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                onTap: (value) {
                  dashBoardProvider.onBottomNavTap(value);

                },
                showUnselectedLabels: true,
                selectedItemColor: AppColors.primaryColor,
                currentIndex: dashBoardProvider.currentIndex,
                unselectedItemColor: Color(0xFF4F4F4F),
                // unselectedIconTheme: IconThemeData(
                //   color: Color(0xFF4F4F4F),
                // ),
                // selectedIconTheme: IconThemeData(
                //   color: AppColors.primaryColor,
                // ),
                selectedLabelStyle: TextStyle(
                    fontSize: getProportionalFontSize(10),
                    color: AppColors.primaryColor,
                    fontFamily: AppFonts.fontBold),
                unselectedLabelStyle: TextStyle(
                    fontSize: getProportionalFontSize(10),
                    color: Color(0xFF4F4F4F),
                    fontFamily: AppFonts.fontMedium),
                // currentIndex: dashBoardProvider.currentIndex,
                items: [
                  BottomNavigationBarItem(
                    label: "",
                    icon: Padding(
                      padding: EdgeInsets.all(2),
                      child: Image.asset(
                        AppImages.feed,
                        color: dashBoardProvider.currentIndex == 0
                            ? AppColors.redColor
                            : Color(0xFF4F4F4F),
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: "",
                    icon: Padding(
                      padding: EdgeInsets.all(5),
                      child: SvgPicture.asset(
                        AppImages.message,
                        color: dashBoardProvider.currentIndex == 1
                            ? AppColors.redColor
                            : Color(0xFF4F4F4F),
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: "",
                    icon: Padding(
                      padding: EdgeInsets.all(5),
                      child: SvgPicture.asset(
                        AppImages.group,
                        color: dashBoardProvider.currentIndex == 2
                            ? AppColors.redColor
                            : Color(0xFF4F4F4F),
                      ),
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: "",
                    icon: Padding(
                      padding: EdgeInsets.all(5),
                      child: SvgPicture.asset(
                        AppImages.profile,
                        color: dashBoardProvider.currentIndex == 3
                            ? AppColors.redColor
                            : Color(0xFF4F4F4F),
                      ),
                    ),
                  ),
                ]),
            body: dashBoardProvider.getScreen(),
          ),
        );
      },),);
  }
}
