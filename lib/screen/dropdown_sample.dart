// import 'package:flutter/material.dart';

// class DropDownSamplePAge extends StatefulWidget {
//   const DropDownSamplePAge({super.key});

//   @override
//   State<DropDownSamplePAge> createState() => _DropDownSamplePAgeState();
// }

// class _DropDownSamplePAgeState extends State<DropDownSamplePAge> {
//   final List<Map<String, dynamic>> expandableList = [
//     {"title": "Price", "description": "20rs"},
//     {"title": "Pricjkhe", "description": "30rs"},
//     {"title": "Pricnjkbhe", "description": "1rs"},
//     {"title": "adfjhehwe", "description": "10rs"},
//     {"title": "ndajksndje", "description": "100rs"},
//     {"title": "brivsfahas", "description": "1000rs"},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Bidding Contents")),
//       body: Container(
//         child: Padding(
//           padding: const EdgeInsets.all(18.0),
//           child: Column(
//             children: [
//               ExpansionTile(
//                 leading: const Icon(Icons.circle_notifications_rounded),
//                 title: const Text("Ice Cream"),
//                 subtitle: const Text("Chocolate flavor"),
//                 children: expandableList
//                     .map(
//                       (e) => ListTile(
//                         leading: const Icon(Icons.check_circle),
//                         title: Text(e["title"] as String),
//                         subtitle: Text(e["description"] as String),
//                         //i agreee checkbox

//                       ),
//                     )
//                     .toList(),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class DropDownSamplePage extends StatefulWidget {
  const DropDownSamplePage({super.key});

  @override
  State<DropDownSamplePage> createState() => _DropDownSamplePageState();
}

class _DropDownSamplePageState extends State<DropDownSamplePage> {
  final List<Map<String, dynamic>> expandableList = [
    {"title": "Price", "description": "20rs", "isChecked": false},
    {"title": "Pricjkhe", "description": "30rs", "isChecked": false},
    {"title": "Pricnjkbhe", "description": "1rs", "isChecked": false},
    {"title": "adfjhehwe", "description": "10rs", "isChecked": false},
    {"title": "ndajksndje", "description": "100rs", "isChecked": false},
    {"title": "brivsfahas", "description": "1000rs", "isChecked": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bidding Contents")),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            ExpansionTile(
              leading: const Icon(Icons.circle_notifications_rounded),
              title: const Text("Ice Cream"),
              subtitle: const Text("Chocolate flavor"),
              children: expandableList
                  .asMap()
                  .entries
                  .map(
                    (entry) => ListTile(
                      leading: Checkbox(
                        value: entry.value["isChecked"] as bool,
                        onChanged: (bool? newValue) {
                          setState(() {
                            expandableList[entry.key]["isChecked"] = newValue!;
                          });
                        },
                      ),
                      title: Text(entry.value["title"] as String),
                      subtitle: Text(entry.value["description"] as String),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
