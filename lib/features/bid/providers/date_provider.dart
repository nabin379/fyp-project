import 'package:flutter/material.dart';

class DateProvider extends ChangeNotifier {
  DateTime? _pickedDate;

  DateTime? get pickedDate => _pickedDate;

  Future<void> pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _pickedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _pickedDate) {
      _pickedDate = picked;
      notifyListeners(); // Notify listeners when a new date is picked
    }
  }
}
