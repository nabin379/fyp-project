import 'package:cem/features/admin_web/home/screens/home_web_screen.dart';
import 'package:cem/screen/web_screens/web_walkthrough.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const WebApp());
}

class WebApp extends StatelessWidget {
  const WebApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:
          //SuccessApply() //PublishedBidMobile()
          // const ,
          //home: AdminManagement(),
          const HomeWebScreen(),
    );
  }
}
