
import 'package:cem/screen/web_screens/provider/switch_provider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';




class Blacklist extends StatefulWidget {
  const Blacklist({super.key});

  @override
  State<Blacklist> createState() => _BlacklistState();
}

class _BlacklistState extends State<Blacklist> {
    bool isEnabled=false;
  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      appBar: AppBar(
        title: const Text("Blacklisting"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body:Consumer<SwitchProvider>(
        builder: (context,switchProvider,child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Box 1
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Box 1",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: switchProvider.box1Items.length,
                          itemBuilder: (context, index) {
                            final item = switchProvider.box1Items[index];
                            return Card(
                              child: ListTile(
                                
                                title: Text(item.title),
                                subtitle: Text(item.subtitle),
                                trailing: Switch(
                                  value: item.isEnabled,
                                  onChanged: (value) =>
                                      switchProvider.toggleBox1Switch(index, value),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                // Box 2
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Box 2",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: switchProvider.box2Items.length,
                          itemBuilder: (context, index) {
                            final item = switchProvider.box2Items[index];
                            return Card(
                              child: ListTile(
                                
                                title: Text(item.title),
                                subtitle: Text(item.subtitle),
                                trailing: Switch(
                                  value: item.isEnabled,
                                  onChanged: (value) =>
                                      switchProvider.toggleBox2Switch(index, value),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
      ),
    );
  }
}