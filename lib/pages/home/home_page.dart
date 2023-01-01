import 'package:final_project/provider/article_provider.dart';
import 'package:final_project/provider/news_provider.dart';
import 'package:final_project/theme.dart';
import 'package:final_project/widgets/news_card.dart';
import 'package:final_project/widgets/top_headline_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    getInit();
    super.initState();
  }

  getInit() async {
    await Provider.of<ArticleProvider>(context, listen: false).getArticles();
    await Provider.of<NewsProvider>(context, listen: false).getNews();
  }

  @override
  Widget build(BuildContext context) {
    ArticleProvider artikelProvider = Provider.of<ArticleProvider>(context);
    NewsProvider newsProvider = Provider.of<NewsProvider>(context);

    FirebaseAuth auth = FirebaseAuth.instance;
    if (auth.currentUser != null) {
      print(auth.currentUser!.email);
    }

    Widget header() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          right: defaultMargin,
          left: defaultMargin,
        ),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(
                    'assets/foto.jpg',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        'Hi, ',
                        style: primaryTextStyle.copyWith(
                          fontWeight: semiBold,
                          fontSize: 16,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          auth.currentUser!.email.toString(),
                          style: primaryTextStyle.copyWith(
                            fontWeight: semiBold,
                            fontSize: 16,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Welcome back!',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 16,
                    ),
                  )
                ],
              ),
            ),
            Icon(
              Icons.notifications,
              color: blueColor,
              size: 30,
            )
          ],
        ),
      );
    }

    Widget searchBar() {
      return Container(
        margin: EdgeInsets.only(
          top: 24,
          left: defaultMargin,
          right: defaultMargin,
        ),
        padding: EdgeInsets.symmetric(
          vertical: 17,
          horizontal: 16,
        ),
        width: double.infinity,
        height: 51,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor3,
        ),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: secondaryColor,
            ),
            SizedBox(
              width: 12,
            ),
            Expanded(
              child: TextFormField(
                style: primaryTextStyle,
                decoration: InputDecoration.collapsed(
                  hintText: 'Search News',
                  hintStyle: secondaryTextStyle.copyWith(
                    fontSize: 14,
                  ),
                ),
              ),
            )
          ],
        ),
      );
    }

    Widget topHeadlinesTitle() {
      return Container(
        margin: EdgeInsets.only(
          top: defaultMargin,
          left: defaultMargin,
          right: defaultMargin,
        ),
        child: Text(
          'Top Headlines',
          style: primaryTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 20,
          ),
        ),
      );
    }

    Widget topHeadlines() {
      return Container(
        margin: EdgeInsets.only(
          top: 14,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: defaultMargin,
              ),
              Row(
                children: artikelProvider.articles
                    .map(
                      (article) => TopHeadlineCard(article),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      );
    }

    Widget newsTitle() {
      return Container(
        margin: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: Text(
          'News',
          style: primaryTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 20,
          ),
        ),
      );
    }

    Widget newsItem() {
      return Column(
        children: newsProvider.news
            .map(
              (news) => NewsCard(news),
            )
            .toList(),
      );
    }

    return ListView(
      children: [
        header(),
        searchBar(),
        topHeadlinesTitle(),
        topHeadlines(),
        newsTitle(),
        newsItem(),
      ],
    );
  }
}
