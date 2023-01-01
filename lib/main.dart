import 'package:final_project/pages/home/main_page.dart';
import 'package:final_project/pages/login_page.dart';
import 'package:final_project/pages/register_page.dart';
import 'package:final_project/pages/splash_screen.dart';
import 'package:final_project/provider/article_provider.dart';
import 'package:final_project/provider/news_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ArticleProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NewsProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashScreen(),
          '/home': (context) => MainPage(),
          '/sign-in': (context) => LoginPage(),
          '/sign-up': (context) => RegisterPage(),
        },
      ),
    );
  }
}
