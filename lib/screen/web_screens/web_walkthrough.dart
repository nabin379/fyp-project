// import 'package:cem/core/constants/app_colors.dart';
// import 'package:cem/features/admin_web/home/screens/home_web_screen.dart';
// import 'package:cem/screen/web_screens/admin_mngt.dart';
// import 'package:cem/screen/web_screens/bid_invitation_page.dart';
// import 'package:cem/screen/web_screens/blacklist.dart';
// import 'package:cem/widgets/custom_elivated_button.dart';
// import 'package:flutter/material.dart';

// class WebWalkThrough extends StatefulWidget {
//   const WebWalkThrough({super.key});

//   @override
//   State<WebWalkThrough> createState() => _WebWalkThroughState();
// }

// class _WebWalkThroughState extends State<WebWalkThrough> {
//   // PageController _controller = PageController(
//   //   initialPage: 0,
//   // );
//   // var currentPage = "";
//   // final String authStatus = 'Unknown';
//   @override
//   void initState() {
//     // _controller = PageController();
//     super.initState();
//   }

//   @override
//   void dispose() {
//     // _controller.dispose();
//     super.dispose();
//   }

//   // void _onPageViewChange(int page) {
//   //   setState(() {
//   //     currentPage = page.toString();
//   //   });
//   // }

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//         body: SizedBox(
//             width: double.infinity,
//             height: double.infinity,
//             child: PageView(
//               controller: _controller,
//               onPageChanged: _onPageViewChange,
//               children: const [
//                 // FirstScreen(),
//                 PublishedBidsPage()
//               ],
//             )));
//   }
// }

// // class FirstScreen extends StatelessWidget {
// //   const FirstScreen({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return Column(
// //       children: [
// //         const Text(
// //             "Welcome to electric procrument  , And loginPAge for admmin in this page "),
// //         AppButton(
// //           onpressed: () {
// //             Navigator.push(context,
// //                 MaterialPageRoute(builder: (contex) => const HomeWebScreen()));
// //           },
// //         )
// //       ],
// //     );
// //   }
// // }
