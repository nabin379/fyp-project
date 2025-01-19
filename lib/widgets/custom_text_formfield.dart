import 'package:flutter/material.dart';

TextFormField customFormField(String customHintText, bool isVisible) {
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

  const BidInvitationCustomTextFormField({
    super.key,
    required this.controller,
    required this.labelText,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: Colors.black, width: 2.0),
        ),
      ),
    );
  }
}
