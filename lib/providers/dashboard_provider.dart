import 'dart:io';

import 'package:cross_file/src/types/interface.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

import '../modules/dashboard/feed_screen.dart';
import '../utils/utils.dart';

class DashBoardProvider extends ChangeNotifier{
  int currentIndex = 0;
  bool canPop = false;
  DateTime? currentBackPressTime;

  CardSwiperController swiperController = CardSwiperController();

  List<DatingList> datingList = [
    DatingList("Lucas", "assets/images/dating_man_1.jpg", "London, United Kingdom", "23"),
    DatingList("Ethan", "assets/images/dating_man_2.jpg", "address", "26"),
    DatingList("Grace", "assets/images/dating_man_3.jpg", "address", "22"),
    DatingList("Emily", "assets/images/dating_women_1.jpg", "address", "29"),
    DatingList("Sophia", "assets/images/dating_women_2.jpg", "address", "30"),
    DatingList("Olivia", "assets/images/dating_women_3.jpg", "address", "25"),
    DatingList("Noah", "assets/images/dating_women_4.jpg", "address", "23"),
    DatingList("Isabella", "assets/images/dating_women_5.jpg", "address", "22"),

  ];


  getScreen() {
    Widget widget = FeedScreen();
    if (currentIndex == 0) {
      widget = FeedScreen();
    // } else if (currentIndex == 1) {
    //   widget = MessageScreen();
    // } else if (controller.currentIndex == 2) {
    //   widget = GroupScreen();
    // } else if (controller.currentIndex == 3) {
    //   widget = ProfileScreen();
    // }
    return widget;
  }
}

  void onPopInvoked() {
    if (currentIndex == 0) {
      canPop = true;
      notifyListeners();
      Utils.showToast("Press the back button again to exit");
      Future.delayed(
        Duration(seconds: 2),
            () {
          canPop = false;
          notifyListeners();
        },
      );
    } else {
      currentIndex = 0;
      notifyListeners();
    }
  }

  void onBottomNavTap(int value) {
    currentIndex = value;
    notifyListeners();
  }
  }

class DatingList {
  final String? name, imageName, address, age;

  DatingList(
      this.name,
      this.imageName,
      this.address,
      this.age,
      );
}