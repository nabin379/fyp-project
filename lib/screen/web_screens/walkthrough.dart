import 'package:cem/widgets/custom_elivated_button.dart';
import 'package:flutter/material.dart';

class WalkThrough extends StatefulWidget {
  const WalkThrough({super.key});

  @override
  State<WalkThrough> createState() => _WalkThroughState();
}

class _WalkThroughState extends State<WalkThrough> {
  PageController _controller = PageController(
    initialPage: 0,
  );
  var currentPage = "";
  String _authStatus = 'Unknown';
  @override
  void initState() {
    _controller = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  _onPageViewChange(int page) {
    setState(() {
      currentPage = page.toString();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: double.infinity,
            height: double.infinity,
            child: PageView(
              controller: _controller,
              onPageChanged: _onPageViewChange,
              children: [
                FirstScreen(),
                SecondScreen(),
                PublishedBidsPage()
              ],
            )));
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
            "Welcome to electric procrument  , And loginPAge for admmin in this page "),
        AppButton(
          onpressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (contex) => SecondScreen()));
          },
        )
      ],
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('E-Marketplace'),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Left-aligned menu items
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
                  ],
                ),
                // Right-aligned menu item
                const SizedBox(width: 20), // Add space between items
              ],
            ),
          ],
          toolbarHeight: 70,
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            Text(
                "dashboard with    navbar containing Home ,PublishedBids, publish a bid, blacklisting, Contractrecords, and Admin Management(at rightmost part of the navbar)")
          ],
        ));
  }
}

class PublishedBidsPage extends StatelessWidget {
  const PublishedBidsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text("published bid page");
  }
}
