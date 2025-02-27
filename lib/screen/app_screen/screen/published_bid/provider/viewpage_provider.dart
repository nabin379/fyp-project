import 'package:flutter/material.dart';

class TableViewModel extends ChangeNotifier {
  // Dummy data (will be fetched from API later)
  List<Map<String, String>> _tableData = [
   
  ];
   bool _isLoading = false; // Loading state

  List<Map<String, String>> get tableData => _tableData;
  bool get isLoading => _isLoading;
  

  // Simulate fetching data from an API
  Future<void> fetchData() async {
     _isLoading = true;
      notifyListeners();

    await Future.delayed(Duration(seconds: 1)); // Simulate API delay
    _tableData = [
      {"Items": "Tablet", "Quantity": "8", "Specification": "Android, 8GB RAM", "Delivery Time": "4 days"},
      {"Items": "Headphones", "Quantity": "12", "Specification": "Noise Cancelling", "Delivery Time": "5 days"},
      {"Items": "Chair", "Quantity": "30", "Specification": "Ergonomic", "Delivery Time": "10 days"},
    ];

    _isLoading = false; 
    notifyListeners(); // Notify UI to rebuild
  }
}
