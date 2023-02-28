import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:gucentral/pages/login_page.dart';
import 'package:gucentral/pages/transcript_page.dart';

import '../pages/MenuPage.dart';
import 'MeduItemList.dart';

class HomePageNavDrawer extends StatefulWidget {
  const HomePageNavDrawer({Key? key}) : super(key: key);
  @override
  State<HomePageNavDrawer> createState() => _HomePageNavDrawerState();
}

class _HomePageNavDrawerState extends State<HomePageNavDrawer> {
  MenuItemlist currentItem = MenuItems.transcript;
  @override
  Widget build(BuildContext context) => ZoomDrawer(
        borderRadius: 40,
        angle: -10,
        slideWidth: MediaQuery.of(context).size.width * 0.8,
        showShadow: true,
        drawerShadowsBackgroundColor: Colors.orangeAccent,
        mainScreen: getScreen(),
        menuScreen: Builder(
          builder: (context) => MenuPage(
              currentItem: currentItem,
              onSelecteItem: (item) {
                setState(() => currentItem = item);
                ZoomDrawer.of(context)!.close();
              }),
        ),
      );
  Widget getScreen() {
    switch (currentItem) {
      case MenuItems.login:
        return LoginPage();
      case MenuItems.transcript:
        return TranscriptPage();
      // case MenuItems.payment:
      //   return PaymentPage();
      // case MenuItems.promos:
      //   return PromoPage();
      // case MenuItems.notification:
      //   return NotificationNDPage();
      // case MenuItems.help:
      //   return HelpNDPage();
      // case MenuItems.aboutUs:
      //   return AboutUsPage();
      // case MenuItems.rateUs:
      default:
        return TranscriptPage();
    }
  }
}