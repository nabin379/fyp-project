import 'package:flutter/material.dart';

class DropdownProvider extends ChangeNotifier {
   bool _isExpanded = false; 
  bool _isLoading = false;
  List<String> _requirements = [];
  bool get isExpanded => _isExpanded;

  bool get isLoading => _isLoading;
  List<String> get requirements => _requirements;

   void toggleDropdown() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }
  
  // Simulate fetching data (API call later)
  Future<void> fetchData() async {
    _isLoading = true;
    notifyListeners();

    // Simulate delay for fetching data
    await Future.delayed(Duration(seconds: 1));

    // Simulated data (replace this with API response)
    _requirements = [
      "1. requirement one ",
      "2. requirement one ",
      "3. requirement one",
      "4. requirement one",
      
    ];

    _isLoading = false;
    notifyListeners();
  }
}
