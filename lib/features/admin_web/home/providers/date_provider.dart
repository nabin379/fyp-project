import 'package:flutter/material.dart';

class DateProvider extends ChangeNotifier {
  DateTime? _bidOpeningDate;

  DateTime? get bidOpeningDate => _bidOpeningDate;

  Future<void> pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _bidOpeningDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _bidOpeningDate) {
      _bidOpeningDate = picked;
      notifyListeners(); // Notify listeners when a new date is picked
    }
  }
}
