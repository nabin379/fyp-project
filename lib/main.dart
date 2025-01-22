import 'package:cem/screen/bid_contents.dart';
import 'package:cem/screen/bid_invitation_page.dart';
import 'package:cem/screen/dashboard.dart';
import 'package:cem/screen/dropdown_sample.dart';
import 'package:cem/screen/signin_page.dart';
import 'package:cem/screen/test.dart';
import 'package:cem/screen/validation_page.dart';
import 'package:cem/screen/web_screens/walkthrough.dart';
import 'package:cem/views/admin_mngt.dart';
import 'package:cem/views/user_verification.dart';
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
      // home: const SigninPage(),
      home:AdminManagement()
      //UserVerification()
      //const WalkThrough(),
      // home: const MyTest(),
      // home: const BidInvitationPage(),
      // home: DropDownSamplePage(),
    );
  }
}
