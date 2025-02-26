import 'package:cem/screen/test_folder/test1.dart';
import 'package:cem/screen/web_screens/bid_contents.dart';
import 'package:cem/screen/web_screens/bid_invitation_page.dart';
import 'package:cem/screen/app_screen/screen/app_walkthrough.dart';
import 'package:cem/screen/web_screens/items_lists.dart';
import 'package:cem/screen/app_screen/screen/validation_page.dart';
import 'package:cem/screen/web_screens/web_walkthrough.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      // home: const WebWalkThrough(),

      //  home: testone(),

      home: AppWalkThrough(),
    );
  }
}

// use home: WebWalkThrough for web and home: AppWalkThrough for App
