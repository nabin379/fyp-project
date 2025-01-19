// import 'package:flutter/material.dart';

// class BiddingContentsPage extends StatefulWidget {
//   const BiddingContentsPage({super.key});

//   @override
//   State<BiddingContentsPage> createState() => _BiddingContentsPageState();
// }

// class _BiddingContentsPageState extends State<BiddingContentsPage> {
//   final List<Map<String, dynamic>> bidingProceduresList = [
//     {
//       "title": "Instructions to Bidders",
//       "description":
//           "Beneath the towering oak tree, the air was thick with the scent of damp earth and moss, a quiet reminder of the forest's age-old secrets. Birds flitted between the branches, their wings barely making a sound as they moved through the dappled sunlight. A gentle breeze stirred the leaves, creating a soft rustling that echoed like whispers from an ancient past. In the distance, the faint trickle of a stream could be heard, weaving its way through the underbrush, adding to the symphony of nature's quiet hum. Time seemed to slow in this tranquil place, where the modern world felt far away, and the worries of the day faded into nothingness. Here, in this hidden corner of the world, the only measure of time was the changing light and the steady rhythm of nature, reminding all who visited that peace could be found in the simplest of moments."
//     },
//     {"title": "Bid Data Sheet", "description": "30rs"},
//     {"title": "Evaluations and Qualiifications", "description": "pending"},
//     {"title": "Criteria", "description": "pending"},
//     {"title": "Bidding Forms", "description": "pending"},
//   ];
//   final List<Map<String, dynamic>> supplyRequirementsList = [
//     {"title": "Schedule of Requirements", "description": "pending"},
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Bidding Contents")),
//       body: Listview(children[Padding(
//         padding: const EdgeInsets.all(18.0),
//         child: Column(
//           children: [
//             ExpansionTile(
//               leading: const Icon(Icons.circle_notifications_rounded),
//               title: const Text("Biding Procedures"),
//               children: bidingProceduresList
//                   .map(
//                     (e) => ListTile(
//                       leading: const Icon(Icons.check_circle),
//                       title: Text(e["title"] as String),
//                       subtitle: Text(e["description"] as String),
//                     ),
//                   )
//                   .toList(),
//             ),
//             ExpansionTile(
//               leading: const Icon(Icons.circle_notifications_rounded),
//               title: const Text("Supply Requirements"),
//               children: supplyRequirementsList
//                   .map(
//                     (e) => ListTile(
//                       leading: const Icon(Icons.check_circle),
//                       title: Text(e["title"] as String),
//                       subtitle: Text(e["description"] as String),
//                     ),
//                   )
//                   .toList(),
//             ),
//           ],
//         ),
//       )]),
//     );
//   }
// }

import 'package:flutter/material.dart';

class BiddingContentsPage extends StatefulWidget {
  const BiddingContentsPage({super.key});

  @override
  State<BiddingContentsPage> createState() => _BiddingContentsPageState();
}

class _BiddingContentsPageState extends State<BiddingContentsPage> {
  final List<Map<String, dynamic>> bidingProceduresList = [
    {
      "title": "Instructions to Bidders",
      "description":
          "Beneath the towering oak tree, the air was thick with the scent of damp earth and moss, a quiet reminder of the forest's age-old secrets. Birds flitted between the branches, their wings barely making a sound as they moved through the dappled sunlight. A gentle breeze stirred the leaves, creating a soft rustling that echoed like whispers from an ancient past. In the distance, the faint trickle of a stream could be heard, weaving its way through the underbrush, adding to the symphony of nature's quiet hum. Time seemed to slow in this tranquil place, where the modern world felt far away, and the worries of the day faded into nothingness. Here, in this hidden corner of the world, the only measure of time was the changing light and the steady rhythm of nature, reminding all who visited that peace could be found in the simplest of moments."
    },
    {"title": "Bid Data Sheet", "description": "30rs"},
    {"title": "Evaluations and Qualifications", "description": "pending"},
    {"title": "Criteria", "description": "pending"},
    {"title": "Bidding Forms", "description": "pending"},
  ];

  final List<Map<String, dynamic>> supplyRequirementsList = [
    {
      "title": "Schedule of Requirements",
      "description":
          "Beneath the towering oak tree, the air was thick with the scent of damp earth and moss, a quiet reminder of the forest's age-old secrets. Birds flitted between the branches, their wings barely making a sound as they moved through the dappled sunlight. A gentle breeze stirred the leaves, creating a soft rustling that echoed like whispers from an ancient past. In the distance, the faint trickle of a stream could be heard, weaving its way through the underbrush, adding to the symphony of nature's quiet hum. Time seemed to slow in this tranquil place, where the modern world felt far away, and the worries of the day faded into nothingness. Here, in this hidden corner of the world, the only measure of time was the changing light and the steady rhythm of nature, reminding all who visited that peace could be found in the simplest of moments."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bidding Contents")),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                ExpansionTile(
                  leading: const Icon(Icons.circle_notifications_rounded),
                  title: const Text("Bidding Procedures"),
                  children: bidingProceduresList
                      .map(
                        (e) => ListTile(
                          leading: const Icon(Icons.check_circle),
                          title: Text(e["title"] as String),
                          subtitle: Text(e["description"] as String),
                        ),
                      )
                      .toList(),
                ),
                ExpansionTile(
                  leading: const Icon(Icons.circle_notifications_rounded),
                  title: const Text("Supply Requirements"),
                  children: supplyRequirementsList
                      .map(
                        (e) => ListTile(
                          leading: const Icon(Icons.check_circle),
                          title: Text(e["title"] as String),
                          subtitle: Text(e["description"] as String),
                        ),
                      )
                      .toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
