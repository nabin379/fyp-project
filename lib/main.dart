import 'package:cem/core/constants/api_endpoints.dart';
import 'package:cem/core/network/http_service.dart';
import 'package:cem/features/bid/repository/bid_repository.dart';
import 'package:cem/main_web.dart';
import 'package:cem/screen/app_screen/screen/auth/providers/login_provider.dart';
import 'package:cem/screen/app_screen/screen/auth/repository/auth_repository.dart';
import 'package:cem/screen/mobile/Pages/home/ui/homepage.dart';
import 'package:cem/screen/mobile/Pages/publishedBids/apply_page.dart';
import 'package:cem/screen/mobile/Pages/publishedBids/publishedBids.dart';
import 'package:cem/screen/mobile/Pages/publishedBids/sucess_apply.dart';
import 'package:cem/screen/mobile/Pages/publishedBids/tender_all.dart';
import 'package:cem/screen/mobile/Pages/publishedBids/view_page.dart';
import 'package:cem/screen/mobile/provider/applypage_provider.dart';
import 'package:cem/screen/mobile/provider/imageprovider.dart';
import 'package:cem/screen/mobile/provider/viewpage_provider.dart';
import 'package:cem/screen/test_folder/test1.dart';
import 'package:cem/screen/web_screens/admin_mngt.dart';
import 'package:cem/screen/web_screens/bid_contents.dart';
import 'package:cem/screen/web_screens/bid_invitation_page.dart';
import 'package:cem/screen/app_screen/screen/auth/pages/login_screen.dart';
import 'package:cem/screen/web_screens/items_lists.dart';
import 'package:cem/screen/app_screen/screen/validation_page.dart';
import 'package:cem/screen/web_screens/provider/switch_provider.dart';
import 'package:cem/screen/web_screens/web_walkthrough.dart';
import 'package:flutter/foundation.dart';
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
      ProxyProvider<HttpService, BidRepository>(
        update: (_, httpService, __) => BidRepository(httpService),
      ),
      ChangeNotifierProvider<LoginProvider>(
        create: (context) => LoginProvider(context.read<AuthRepository>()),
      ),
      ChangeNotifierProvider(
          create: (context) => TableViewModel()), // Provide ViewModel
      ChangeNotifierProvider(create: (context) => DropdownProvider()),
      ChangeNotifierProvider(create: (context) => ImageProviderClass()),
      ChangeNotifierProvider(create: (context) => SwitchProvider()),
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
      home: const Homepage(),

      //SuccessApply() //PublishedBidMobile()
      // const ,
      //home: AdminManagement(),
      // const WebWalkThrough(),
    );
  }
}

// use home: WebWalkThrough for web and home: AppWalkThrough for App
