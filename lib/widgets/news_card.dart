import 'package:final_project/model/news_model.dart';
import 'package:final_project/pages/detail_news.dart';
import 'package:final_project/theme.dart';
import 'package:final_project/widgets/bookmark.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final NewsModel news;
  const NewsCard(
    this.news, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailNews(news),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          top: 16,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                      image: NetworkImage(
                        news.urlToImage,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 24,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        news.title,
                        style: primaryTextStyle.copyWith(
                          fontWeight: semiBold,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        news.description,
                        style: secondaryTextStyle.copyWith(
                          fontWeight: light,
                          fontSize: 10,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Bookmark(),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Divider(
              thickness: 1,
              color: greyColor,
            ),
          ],
        ),
      ),
    );
  }
}
