import 'package:cem/core/constants/api_endpoints.dart';
import 'package:cem/core/network/http_service.dart';
import 'package:cem/screen/app_screen/screen/auth/providers/login_provider.dart';
import 'package:cem/screen/app_screen/screen/auth/repository/auth_repository.dart';
import 'package:cem/screen/test_folder/test1.dart';
import 'package:cem/screen/web_screens/bid_contents.dart';
import 'package:cem/screen/web_screens/bid_invitation_page.dart';
import 'package:cem/screen/app_screen/screen/auth/pages/login_screen.dart';
import 'package:cem/screen/web_screens/items_lists.dart';
import 'package:cem/screen/app_screen/screen/validation_page.dart';
import 'package:cem/screen/web_screens/web_walkthrough.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      Provider<HttpService>(
        create: (_) => HttpService(ApiEndpoints.baseUrl),
        lazy: false,
      ),
      ProxyProvider<HttpService, AuthRepository>(
        update: (_, httpService, __) => AuthRepository(httpService),
      ),
      ChangeNotifierProvider<LoginProvider>(
        create: (context) => LoginProvider(context.read<AuthRepository>()),
      ),
    ],
    child: const MyApp(),
  ));
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

      home: const LoginScreen(),
    );
  }
}

// use home: WebWalkThrough for web and home: AppWalkThrough for App
