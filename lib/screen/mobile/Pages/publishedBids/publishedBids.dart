import 'package:cem/screen/mobile/Pages/publishedBids/apply_page.dart';
import 'package:cem/screen/mobile/Pages/publishedBids/bid_now_page.dart';
import 'package:cem/screen/mobile/Pages/publishedBids/view_page.dart';
import 'package:flutter/material.dart';

class PublishedBidMobile extends StatefulWidget {
  const PublishedBidMobile({super.key});

  @override
  State<PublishedBidMobile> createState() => _PublishedBidMobileState();
}

class _PublishedBidMobileState extends State<PublishedBidMobile> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController publicEntityController = TextEditingController();

  final List<Map<String, String>> results = [
    {'title': 'Bid 1', 'details': 'Details about bid 1'},
    {'title': 'Bid 2', 'details': 'Details about bid 2'},
    {'title': 'Bid 3', 'details': 'Details about bid 3'},
    {'title': 'Bid 4', 'details': 'Details about bid 4'},
    {'title': 'Bid 5', 'details': 'Details about bid 5'},
    {'title': 'Bid 6', 'details': 'Details about bid 6'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Published Bids'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  labelText: 'Name', border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            TextField(
              controller: typeController,
              decoration: InputDecoration(
                  labelText: 'Type', border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            TextField(
              controller: publicEntityController,
              decoration: InputDecoration(
                  labelText: 'Public Entity', border: OutlineInputBorder()),
            ),
            SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Search',
                  style: TextStyle(fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Published Bids',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: results.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: ExpansionTile(
                      title: Text(results[index]['title']!),
                      subtitle: Text(results[index]['details']!),
                      // trailing: Icon(Icons.more_vert),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                   Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ViewPage()),
                    );
                                },
                                child: Text(
                                  'View',
                                  style: TextStyle(fontSize: 16),
                                ),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                              SizedBox(width: 10,),
                              ElevatedButton(
                                onPressed: () {
                                   Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ApplyPage()),
                    );
                                },
                                child: Text(
                                  'Apply',
                                  style: TextStyle(fontSize: 16),
                                ),
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
