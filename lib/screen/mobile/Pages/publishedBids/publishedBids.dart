import 'package:cem/screen/mobile/Pages/publishedBids/bid_now_page.dart';
import 'package:flutter/material.dart';

class TenderOpened extends StatefulWidget {
  const TenderOpened({super.key});

  @override
  State<TenderOpened> createState() => _TenderOpenedState();
}

class _TenderOpenedState extends State<TenderOpened> {
  final List<Map<String, dynamic>> data = [
    {"title": "Building Construction", "expiry": "30 june"},
    {"title": "Furniture 50 Chairs", "expiry": "3 december"},
    {"title": "Stage Construction", "expiry": "10 october"},
    {"title": "Stage Construction", "expiry": "10 october"},
    {"title": "Stage Construction", "expiry": "10 october"},
    {"title": "Stage Construction", "expiry": "10 october"},
    {"title": "Stage Construction", "expiry": "10 october"},
    {"title": "Stage Construction", "expiry": "10 october"},
    {"title": "Stage Construction", "expiry": "10 october"},
    {"title": "Stage Construction", "expiry": "10 october"},
    {"title": "Stage Construction", "expiry": "10 october"},
    {"title": "Stage Construction", "expiry": "10 october"},
    {"title": "Stage Construction", "expiry": "10 october"},
    {"title": "Stage Construction", "expiry": "10 october"},
    {"title": "Stage Construction", "expiry": "10 october"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 82, 162, 203),
        title: const Center(
            child: Text(
          "Tender opened",
          style: TextStyle(
              fontSize: 17, color: Colors.white, fontWeight: FontWeight.bold),
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
        child: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ExpansionTile(
              title: Text(data[index]['title']),
              subtitle: Text(
                "Expiry date: ${data[index]['expiry']}",
                style: const TextStyle(color: Colors.grey),
              ),
              leading: const Icon(Icons.arrow_right),
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BidNowPage(),
                        ),
                      );
                    },
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.green),
                    child: const Text(
                      "Bid Now",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
