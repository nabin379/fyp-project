import 'package:cem/core/constants/app_colors.dart';
import 'package:cem/screen/web_screens/admin_mngt.dart';
import 'package:cem/screen/web_screens/bid_invitation_page.dart';
import 'package:cem/screen/web_screens/blacklist.dart';
import 'package:cem/screen/web_screens/web_walkthrough.dart';
import 'package:cem/widgets/custom_elivated_button.dart';
import 'package:flutter/material.dart';

class HomeWebScreen extends StatelessWidget {
  const HomeWebScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'AVAS-BMC',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: [
            Row(
              children: [
                NavButton(
                  title: 'Published bids',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PublishedBidsPage()),
                    );
                  },
                ),
                NavButton(
                  title: 'Publish a bids',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const PublishBidPage()),
                    );
                  },
                ),
                // NavButton(
                //   title: 'blacklisting',
                //   onPressed: () {
                //     Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => const Blacklist()),
                //     );
                //   },
                // ),

                NavButton(
                  title: 'Admin Management',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AdminManagement()),
                    );
                  },
                ),
              ],
            ),
            // Right-aligned menu item
            const SizedBox(width: 20),
          ],
          toolbarHeight: 70,
          backgroundColor: AppColor.primaryColor),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Text(
                          "Welcome to our Bidding Platform!",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30.0),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            " Participate in exciting auctions and grab the best deals. Browse through exclusive listings, bid in real time, and win amazing items with ease. Enjoy a seamless experience with our secure transactions and user-friendly interface. Start bidding today and get the products you love at unbeatable prices. Start bidding today and get the products you love at unbeatable prices! Whether you're a seasoned bidder or a newcomer, our platform provides you with all the tools and insights you need to make informed bids. Discover a wide range of categories, from electronics to collectibles, ensuring there's something for everyone. With real-time updates, transparent bidding history, and an intuitive dashboard!",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Image.asset(
                      "assets/images/bmc.jpeg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              color: AppColor.primaryColor,
              child: const Center(
                child: Text(
                  "© 2025 Bidding Platform. All rights reserved.",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PublishedBidsPage extends StatelessWidget {
  const PublishedBidsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox(child: Text("published bid page")),
    );
  }
}
