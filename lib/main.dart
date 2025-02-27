import 'package:cem/screen/app_screen/screen/published_bid/provider/apply_provider.dart';
import 'package:cem/screen/app_screen/screen/published_bid/provider/imageprovider.dart';
import 'package:cem/screen/app_screen/screen/published_bid/provider/viewpage_provider.dart';
import 'package:cem/screen/test_folder/test1.dart';
import 'package:cem/screen/web_screens/provider/switch_provider.dart';
import 'package:cem/screen/web_screens/screen/bid_contents.dart';
import 'package:cem/screen/web_screens/screen/bid_invitation_page.dart';
import 'package:cem/screen/app_screen/screen/login/app_walkthrough.dart';
import 'package:cem/screen/web_screens/screen/items_lists.dart';
import 'package:cem/screen/app_screen/screen/registration_page.dart';
import 'package:cem/screen/web_screens/screen/web_walkthrough.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
       providers: [
        ChangeNotifierProvider(create: (context) => TableViewModel()), // Provide ViewModel
        ChangeNotifierProvider(create: (context) => DropdownProvider()),
        ChangeNotifierProvider(create: (context) => ImageProviderClass()),
         ChangeNotifierProvider<SwitchProvider>(create: (_)=>SwitchProvider())
      ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      // home: const WebWalkThrough(),

      //  home: testone(),

      home: AppWalkThrough(),
      ),
    );
  }
}

// use home: WebWalkThrough for web and home: AppWalkThrough for App
