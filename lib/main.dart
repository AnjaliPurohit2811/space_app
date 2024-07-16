import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_app/screens/detailscreen/detail_screen.dart';
import 'package:space_app/screens/favouritescreen/favourite_screen.dart';
import 'package:space_app/screens/homescreen/home_screen.dart';
import 'package:space_app/screens/provider/space_provider.dart';
import 'package:space_app/screens/splashscreen/splash_screen.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => SpaceProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
