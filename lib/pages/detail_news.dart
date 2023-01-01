import 'package:final_project/model/articles_model.dart';
import 'package:final_project/model/news_model.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class DetailNews extends StatelessWidget {
  final NewsModel news;
  const DetailNews(
    this.news, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    PreferredSizeWidget appBar() {
      return AppBar(
        centerTitle: true,
        title: Text(
          'Detail News',
          style: whiteTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 18,
          ),
        ),
        elevation: 0,
        backgroundColor: blueColor,
      );
    }

    Widget header() {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: defaultMargin,
            ),
            Text(
              news.title,
              style: blueTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${news.author} -',
                  style: primaryTextStyle.copyWith(
                    fontSize: 12,
                  ),
                ),
                Text(
                  news.source.name,
                  style: blueTextStyle.copyWith(
                    fontWeight: medium,
                    fontSize: 12,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              news.publishedAt,
              style: secondaryTextStyle.copyWith(
                fontSize: 12,
              ),
            ),
          ],
        ),
      );
    }

    Widget foto() {
      return Container(
        margin: EdgeInsets.only(
          top: 20,
        ),
        width: double.infinity,
        height: 250,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              news.urlToImage,
            ),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    Widget content() {
      return Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: defaultMargin,
            ),
            Text(
              news.content,
              style: primaryTextStyle.copyWith(
                fontSize: 12,
                wordSpacing: 1.5,
              ),
            ),
            SizedBox(
              height: defaultMargin,
            ),
            Text(
              'Link Berita',
              style: blueTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 12,
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Text(
              news.url,
              style: secondaryTextStyle.copyWith(
                fontWeight: light,
                fontSize: 10,
              ),
            ),
            SizedBox(
              height: defaultMargin,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor2,
      appBar: appBar(),
      body: ListView(
        children: [
          header(),
          foto(),
          content(),
        ],
      ),
    );
  }
}
