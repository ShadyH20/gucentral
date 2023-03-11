import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gucentral/widgets/MyColors.dart';

import '../widgets/MeduItemList.dart';
import '../widgets/MyColors.dart';

class MenuPage extends StatelessWidget {
  late MenuItemlist currentItem;
  late ValueChanged<MenuItemlist> onSelecteItem;
  MenuPage({required this.currentItem, required this.onSelecteItem});

  @override
  Widget build(BuildContext context) => Theme(
        data: ThemeData.dark(),
        child: Scaffold(
          backgroundColor: MyColors.primary,
          body: Container(
            // color: MyColors.accent,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 9,
                  child: SizedBox(
                    // color: MyColors.accent,
                    width: 200,
                    child: Column(
                      children: [
                        ...MenuItems.all.map(buildMenuItem).toList(),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Align(
                    alignment: FractionalOffset.bottomCenter,
                    child: Container(
                      // height: 150,
                      decoration: const BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: MyColors.background,
                                offset: Offset(-30, 30)),
                            BoxShadow(
                                color: MyColors.secondary,
                                offset: Offset(30, 30))
                          ],
                          color: MyColors.secondary,
                          borderRadius: BorderRadius.horizontal(
                            left: Radius.circular(25),
                          )),
                      padding: const EdgeInsets.all(42),
                      width: double.infinity,
                      child: SvgPicture.asset(
                        "assets/images/main-logo.svg",
                        // height: 70,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
  Widget buildMenuItem(MenuItemlist item) {
    if (item.title == "Profile") {
      return ListTile(
        contentPadding: const EdgeInsets.only(top: 30, bottom: 50),
        horizontalTitleGap: 10.0,
        leading: SvgPicture.asset(
          "assets/images/profile.svg",
          height: 40,
          // color: MyColors.secondary,
        ),
        title: const Text("shady.farag"),
        subtitle:
            // TextButton(
            //   style: ButtonStyle(alignment: Alignment.topLeft),
            //   onPressed: () {},
            //   child:
            const Text(
          "Edit Profile",
          style: TextStyle(
            color: MyColors.background,
            decoration: TextDecoration.underline,
          ),
        ),
        // ),
      );
    }
    if (item.title == "Seperator") {
      return Column(children: [
        Container(height: 40),
        const Divider(
          color: MyColors.background,
          thickness: 4,
        ),
      ]);
    } else {
      return ListTileTheme(
        contentPadding: const EdgeInsets.symmetric(horizontal: 0),
        selectedColor: MyColors.background,
        textColor: MyColors.background.withOpacity(0.5),
        iconColor: MyColors.background.withOpacity(0.5),
        child: ListTile(
          // selectedTileColor: Colors.white,
          // textColor: MyColors.background.withOpacity(0.5),
          selected: currentItem == item,
          minLeadingWidth: 0,
          leading: item.icon != null ? Icon(item.icon) : null,
          title: Text(
            item.title,
            textAlign: TextAlign.start,
            style: const TextStyle(
              fontFamily: "Outfit",
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          onTap: () => onSelecteItem(item),
        ),
      );
    }
  }
}

class MenuItems {
  static const profile = MenuItemlist('Profile');
  static const login = MenuItemlist('Logout', Icons.logout_outlined);
  static const transcript = MenuItemlist('Transcript');
  static const home = MenuItemlist('Home');
  static const grades = MenuItemlist('Grades');
  static const courses = MenuItemlist('Courses');
  static const schedule = MenuItemlist('Schedule');
  static const map = MenuItemlist('Map');
  static const settings = MenuItemlist('Settings', Icons.settings);
  static const seperator = MenuItemlist('Seperator');
  // static const promos = MenuItemlist('Promo', Icons.card_giftcard);
  // static const notification = MenuItemlist('Notification', Icons.notifications);
  // static const help = MenuItemlist('Help', Icons.help);
  // static const aboutUs = MenuItemlist('About Us', Icons.info_outline);
  // static const rateUs = MenuItemlist('Rate Us', Icons.star_border);
  static final all = <MenuItemlist>[
    profile,
    home,
    grades,
    courses,
    schedule,
    transcript,
    map,
    seperator,
    settings,
    login,
    // payment,
    // promos,
    // notification,
    // help,
    // aboutUs,
    // rateUs
  ];
}
