import 'package:final_project/pages/home/bookmark_page.dart';
import 'package:final_project/pages/home/home_page.dart';
import 'package:final_project/pages/home/profile_page.dart';
import 'package:final_project/theme.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget customBottomNav() {
      return BottomNavigationBar(
        backgroundColor: backgroundColor3,
        type: BottomNavigationBarType.fixed,
        onTap: (value) {
          setState(
            () {
              currentIndex = value;
            },
          );
        },
        items: [
          BottomNavigationBarItem(
            icon: Column(
              children: [
                Image.asset(
                  'assets/icon_home.png',
                  color: currentIndex == 0 ? blueColor : secondaryColor,
                ),
                Text(
                  'Home',
                  style: currentIndex == 0
                      ? blueTextStyle.copyWith(
                          fontWeight: medium,
                          fontSize: 9,
                        )
                      : secondaryTextStyle.copyWith(
                          fontWeight: medium,
                          fontSize: 9,
                        ),
                ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: EdgeInsets.symmetric(
                vertical: 15,
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/icon_bookmark.png',
                    color: currentIndex == 1 ? blueColor : secondaryColor,
                  ),
                  Text(
                    'Bookmark',
                    style: currentIndex == 1
                        ? blueTextStyle.copyWith(
                            fontWeight: medium,
                            fontSize: 9,
                          )
                        : secondaryTextStyle.copyWith(
                            fontWeight: medium,
                            fontSize: 9,
                          ),
                  ),
                ],
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: EdgeInsets.symmetric(
                vertical: 15,
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/icon_user.png',
                    color: currentIndex == 2 ? blueColor : secondaryColor,
                  ),
                  Text(
                    'My Account',
                    style: currentIndex == 2
                        ? blueTextStyle.copyWith(
                            fontWeight: medium,
                            fontSize: 9,
                          )
                        : secondaryTextStyle.copyWith(
                            fontWeight: medium,
                            fontSize: 9,
                          ),
                  ),
                ],
              ),
            ),
            label: '',
          ),
        ],
      );
    }

    Widget body() {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return BookmarkPage();
        case 2:
          return ProfilePage();
        default:
          return HomePage();
      }
    }

    return Scaffold(
      backgroundColor: backgroundColor2,
      bottomNavigationBar: customBottomNav(),
      body: body(),
    );
  }
}
