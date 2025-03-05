class Validation {
  static String? validateEmpty(String? value, String errText) {
    if (value == null || value.isEmpty) {
      return errText;
    }
    return null; // No error
  }
}
