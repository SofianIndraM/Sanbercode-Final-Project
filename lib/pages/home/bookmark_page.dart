import 'package:final_project/theme.dart';
import 'package:flutter/material.dart';

class BookmarkPage extends StatelessWidget {
  const BookmarkPage({super.key});

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget appBar() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Bookmark',
          style: whiteTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 18,
          ),
        ),
        elevation: 0,
        backgroundColor: blueColor,
      );
    }

    Widget content() {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/bookmark.png',
            ),
            SizedBox(
              height: defaultMargin,
            ),
            Text(
              ' You don\'t have bookmark?',
              style: primaryTextStyle.copyWith(
                fontWeight: medium,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Text(
              'Let\'s find your favorite news',
              style: secondaryTextStyle,
            ),
            Container(
              margin: EdgeInsets.only(
                top: 20,
              ),
              height: 44,
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/home');
                },
                style: TextButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 10,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: blueColor,
                ),
                child: Text(
                  'Explore News',
                  style: whiteTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 16,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: appBar(),
      body: content(),
    );
  }
}
