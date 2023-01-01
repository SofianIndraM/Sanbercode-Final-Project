import 'package:flutter/material.dart';

import '../theme.dart';

class Bookmark extends StatefulWidget {
  const Bookmark({super.key});

  @override
  State<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  @override
  bool isBookmark = false;
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isBookmark = !isBookmark;
        });
        if (isBookmark) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 1),
              backgroundColor: blueColor,
              content: Text(
                'Has been added to the Bookmark',
                style: whiteTextStyle.copyWith(
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 1),
              backgroundColor: Colors.red,
              content: Text(
                'Has been removed from the Bookmark',
                style: whiteTextStyle.copyWith(
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          );
        }
      },
      child: Image.asset(
        isBookmark
            ? 'assets/button_bookmark_press.png'
            : 'assets/button_bookmark.png',
      ),
    );
  }
}
