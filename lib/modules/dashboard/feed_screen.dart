import 'package:dating_provider_pattern/providers/dashboard_provider.dart';
import 'package:dating_provider_pattern/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../config/app_fonts.dart';
import '../../config/size_config.dart';
import '../../utils/app_images.dart';
import '../../utils/colors.dart';
import '../../utils/secure_storage.dart';
import '../../utils/utils.dart';


class FeedScreen extends StatelessWidget {
  const FeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(onPressed: () {
          Utils.showCustomDialog(
            bar: true,
            context: context,
            title: "Logout",
            buttons: [
              TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(
                    Colors.black.withOpacity(.1),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "No",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: getProportionalFontSize(14),
                      fontFamily: AppFonts.fontRegular),
                ),
              ),
              TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(
                    AppColors.primaryColor.withOpacity(.1),
                  ),
                ),
                onPressed: () async {
                  await StorageService()
                      .deleteAllSecureData();

                  Navigator.pushNamedAndRemoveUntil(context, AppRoute.loginRoute, (route) => false);
                },
                child: Text(
                  "Yes",
                  style: TextStyle(
                      color: Color(0xFFFF4350),
                      fontSize: getProportionalFontSize(14),
                      fontFamily: AppFonts.fontRegular),
                ),
              ),
            ],
            description:
            "Are you sure you want to logout?",
          );
        }, icon: Icon(Icons.logout,color: Color(0xFFFF4350),),),
        actions: [
          Container(
            margin: EdgeInsets.only(
              right: getProportionateScreenWidth(26),
            ),
            child: SvgPicture.asset(
              AppImages.filter,
            ),
          ),
        ],
        title: SvgPicture.asset(
          AppImages.syndeo,
          width: getProportionateScreenWidth(160),
          height: getProportionateScreenHeight(28),
        ),
      ),
      body: Consumer<DashBoardProvider>(builder: (context, dashBoardProvider, child) {
        return SafeArea(
          child: Column(
            children: [
             Flexible(child: SingleChildScrollView(child: Column(children: [
               Center(
                 child: RichText(
                   text: TextSpan(
                     children: [
                       TextSpan(
                         text: "You are currently swiping in",
                         style: TextStyle(
                           fontFamily: AppFonts.fontMedium,
                           fontSize: getProportionalFontSize(11),
                           color: Color(0xFFA1A1A1),
                         ),
                       ),
                       TextSpan(
                         text: " friendship",
                         style: TextStyle(
                           fontFamily: AppFonts.fontBold,
                           fontSize: getProportionalFontSize(11),
                           color: Color(0xFFA1A1A1),
                         ),
                       ),
                       TextSpan(
                         text: " mode",
                         style: TextStyle(
                           fontFamily: AppFonts.fontMedium,
                           fontSize: getProportionalFontSize(11),
                           color: Color(0xFFA1A1A1),
                         ),
                       ),
                     ],
                   ),
                 ),
               ),
               SizedBox(height: getProportionateScreenHeight(11),),
               SizedBox(
                 height: getProportionateScreenHeight(507),
                 child: CardSwiper(
                   controller: dashBoardProvider.swiperController,
                   cardsCount: dashBoardProvider.datingList.length,
                   numberOfCardsDisplayed: 1,
                   cardBuilder:
                       (context, index, horizontalOffsetPercentage, verticalOffsetPercentage) {
                     return Container(
                       padding: EdgeInsets.symmetric(
                         horizontal: getProportionateScreenWidth(26),
                         vertical: getProportionateScreenHeight(26),
                       ),
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(30),
                         image: DecorationImage(
                             image: AssetImage(
                               dashBoardProvider.datingList[index].imageName.toString(),
                             ),
                             fit: BoxFit.cover),
                       ),
                       child: Column(
                         mainAxisAlignment: MainAxisAlignment.end,
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(
                             "${dashBoardProvider.datingList[index].name.toString()}, ${dashBoardProvider.datingList[index].age.toString()}",
                             style: TextStyle(
                               fontSize: getProportionalFontSize(24),
                               fontFamily: 'poppins',
                               fontWeight: FontWeight.w700,
                               color: Colors.white,
                             ),
                           ),
                           SizedBox(
                             height: getProportionateScreenHeight(5),
                           ),
                           Text(
                             dashBoardProvider.datingList[index].address.toString(),
                             style: TextStyle(
                                 fontSize: getProportionalFontSize(16),
                                 fontFamily: 'poppins',
                                 fontWeight: FontWeight.w700,
                                 color: Colors.white),
                           ),
                           SizedBox(
                             height: getProportionateScreenHeight(5),
                           ),
                           Text(
                             "Lorem ipsum dolor sit aet, consectetur acing elit, sed do eiusmod tempor incididuntdolor sit",
                             style: TextStyle(
                                 fontSize: getProportionalFontSize(12),
                                 fontFamily: 'poppins',
                                 fontWeight: FontWeight.w400,
                                 color: Colors.white),
                           ),
                         ],
                       ),
                     );
                   },
                 ),
               ),
             ]),),),
              SizedBox(
                height: getProportionateScreenHeight(18.0),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        dashBoardProvider.swiperController.swipeLeft();
                      },
                      child: SvgPicture.asset(
                        AppImages.no,
                        width: getProportionateScreenWidth(75),
                        height: getProportionateScreenHeight(75),
                      ),
                    ),
                    Container(
                      width: getProportionateScreenWidth(12),
                    ),
                    GestureDetector(
                      onTap: () {
                        dashBoardProvider.swiperController.swipeRight();
                      },
                      child: SvgPicture.asset(
                        AppImages.yes,
                        width: getProportionateScreenWidth(75),
                        height: getProportionateScreenHeight(75),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },)
    );
  }
}
