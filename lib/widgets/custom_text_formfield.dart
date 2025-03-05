import 'package:flutter/material.dart';

TextFormField customFormField(
    String customHintText, bool isVisible, controller) {
  return TextFormField(
    obscureText: isVisible,

    ///makes pw invisible
    decoration: InputDecoration(
      fillColor: Colors.white,
      filled: true,
      hintText: customHintText,
      border: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1,
            style: BorderStyle.solid,
          ),
          borderRadius: BorderRadius.circular(20.0)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: const BorderSide(
            width: 1,
            style: BorderStyle.solid,
            color: Color.fromARGB(255, 95, 42, 199),
          )),
    ),
  );
}

class BidInvitationCustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final TextInputType keyboardType;
  final bool enabled;
  final bool readOnly;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;

  const BidInvitationCustomTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    this.enabled = true,
    this.readOnly = false,
    this.onTap,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      onTap: onTap,
      readOnly: readOnly,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.black, width: 2.0),
        ),
      ),
      validator: validator,
    );
  }
}
