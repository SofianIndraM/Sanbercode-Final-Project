import 'package:final_project/model/articles_model.dart';
import 'package:final_project/pages/detail_top_headline.dart';
import 'package:final_project/theme.dart';
import 'package:flutter/material.dart';

class TopHeadlineCard extends StatelessWidget {
  final ArticlesModel article;
  const TopHeadlineCard(
    this.article, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailTopHeadlines(article),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(
          right: 24,
          bottom: defaultMargin,
        ),
        width: 250,
        height: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: NetworkImage(
              article.urlToImage,
            ),
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: blueColor.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 7,
              offset: Offset(7, 8),
            )
          ],
        ),
        child: Container(
          margin: EdgeInsets.only(
            top: 15,
          ),
          height: 80,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              begin: Alignment.center,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white.withOpacity(0),
                Colors.black.withOpacity(0.95),
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title,
                  style: whiteTextStyle.copyWith(
                    fontWeight: semiBold,
                  ),
                  maxLines: 2,
                ),
                Text(
                  article.description,
                  style: whiteTextStyle.copyWith(
                    fontWeight: light,
                    fontSize: 10,
                  ),
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
