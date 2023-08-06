import 'package:flutter/material.dart';
import 'package:movies_app/core/services/service_locator.dart';

import 'core/utilis/app_strings.dart';
import 'movies/presentation/screens/movies_screen.dart';

void main() {
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Appstrings.appName,
      theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: const Color(0xff1e1e29),
          cardColor: const Color(0xff303030),
          appBarTheme: AppBarTheme(
            color: Colors.grey.shade900,
          )),
      debugShowCheckedModeBanner: false,
      home: const MainMoviesScreen(),
    );
  }
}
