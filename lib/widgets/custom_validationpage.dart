import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

TextFormField customValidationForm(
    {required String customHintText,
    required TextEditingController controller,
    Widget? customPrefix,
    TextInputType? customkeyboardtype}) {
  return TextFormField(
    keyboardType: customkeyboardtype,
    controller: controller,

    // decoration: InputDecoration(
    // hintText: "Enter your name",
    //     hintText: customHintText,
    //     border: const OutlineInputBorder(
    //         borderSide: BorderSide(color: Colors.deepPurple)),
    //     enabledBorder: const OutlineInputBorder(
    //         borderSide: BorderSide(color: Colors.deepPurple))),

    decoration: InputDecoration(
      prefix: customPrefix,
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
