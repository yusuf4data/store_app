import 'package:flutter/material.dart';
import 'package:store_app/constants/global_colors.dart';
import 'package:store_app/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: lightScaffoldColor,

        primaryColor: lightCardColor,

        appBarTheme: AppBarTheme(
          iconTheme: IconThemeData(
            color: lightIconsColor,
          ),
          backgroundColor: lightScaffoldColor,
          centerTitle: true,
          titleTextStyle: TextStyle(
              color: lightTextColor, fontSize: 22, fontWeight: FontWeight.bold),
          elevation: 0,
        ),
        iconTheme: IconThemeData(
          color: lightIconsColor,
        ),
        cardColor: lightCardColor,
        brightness: Brightness.light,
        colorScheme: ThemeData()
            .colorScheme
            .copyWith(secondary: lightIconsColor, brightness: Brightness.light),

        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
