
import 'package:cem/screen/web_screens/Datamodel/blacklist.dart';
import 'package:flutter/material.dart';


class SwitchProvider extends ChangeNotifier {
  // Box 1 items
  List<ItemModel> box1Items = [
    ItemModel(title: "List Item 1", subtitle: "Details about item 1.", isEnabled: false),
    ItemModel(title: "List Item 2", subtitle: "Details about item 2.", isEnabled: false),
    ItemModel(title: "List Item 3", subtitle: "Details about item 3.", isEnabled: false),
  ];

  // Box 2 items
  List<ItemModel> box2Items = [
    ItemModel(title: "List Item 4", subtitle: "Details about item 4.", isEnabled: false),
    ItemModel(title: "List Item 5", subtitle: "Details about item 5.", isEnabled: false),
    ItemModel(title: "List Item 6", subtitle: "Details about item 6.", isEnabled: false),
  ];

  // Toggle switch for Box 1
  void toggleBox1Switch(int index, bool value) {
    box1Items[index].isEnabled = value;
    notifyListeners();
  }

  // Toggle switch for Box 2
  void toggleBox2Switch(int index, bool value) {
    box2Items[index].isEnabled = value;
    notifyListeners();
  }
}

