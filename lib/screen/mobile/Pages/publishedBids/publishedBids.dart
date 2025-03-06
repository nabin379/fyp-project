import 'package:cem/features/bid/providers/bid_invitation_list_provider.dart';
import 'package:cem/screen/mobile/Pages/publishedBids/apply_page.dart';
import 'package:cem/screen/mobile/Pages/publishedBids/view_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PublishedBidMobile extends StatefulWidget {
  const PublishedBidMobile({super.key});

  @override
  State<PublishedBidMobile> createState() => _PublishedBidMobileState();
}

class _PublishedBidMobileState extends State<PublishedBidMobile> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController typeController = TextEditingController();
  final TextEditingController publicEntityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Fetch published bids when the screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PublishedBidsProvider>().getPublishedBids();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Published Bids'),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Fields
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                  labelText: 'Name', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: typeController,
              decoration: const InputDecoration(
                  labelText: 'Type', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: publicEntityController,
              decoration: const InputDecoration(
                  labelText: 'Public Entity', border: OutlineInputBorder()),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Trigger fetching published bids again
                  context.read<PublishedBidsProvider>().getPublishedBids();
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Search',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              'Published Bids',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Consumer to listen to PublishedBidsProvider state
            Expanded(
              child: Consumer<PublishedBidsProvider>(
                builder: (context, provider, child) {
                  if (provider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (provider.bidInvitations.isEmpty) {
                    return const Center(
                      child: Text("No published bids available."),
                    );
                  }

                  return ListView.builder(
                    itemCount: provider.bidInvitations.length,
                    itemBuilder: (context, index) {
                      final bid = provider.bidInvitations[index];
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        child: ExpansionTile(
                          title: Text(bid.bid.bankName ?? ""),
                          subtitle: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(bid.bid.validDate?.toIso8601String() ?? ""),
                              Text(bid.bid.closeDate?.toIso8601String() ?? ""),
                            ],
                          ),
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ViewPage()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: const Text(
                                      'View',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const ApplyPage()),
                                      );
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Colors.blue,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                    ),
                                    child: const Text(
                                      'Apply',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
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
