import 'package:flutter/material.dart';

class Test1 extends StatelessWidget {
  const Test1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bidding Platform"),
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "Welcome to our Bidding Platform! Participate in exciting auctions and grab the best deals. Browse through exclusive listings, bid in real time, and win amazing items with ease. Enjoy a seamless experience with our secure transactions and user-friendly interface. Start bidding today and get the products you love at unbeatable prices. Start bidding today and get the products you love at unbeatable prices! Whether you're a seasoned bidder or a newcomer, our platform provides you with all the tools and insights you need to make informed bids. Discover a wide range of categories, from electronics to collectibles, ensuring there's something for everyone. With real-time updates, transparent bidding history, and an intuitive dashboard!",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child:  Image.asset(
                      "assets/images/bmc.jpeg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.purple,
            child: Center(
              child: Text(
                "© 2025 Bidding Platform. All rights reserved.",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}