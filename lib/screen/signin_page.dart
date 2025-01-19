import 'package:cem/screen/validation_page.dart';
import 'package:cem/widgets/custom_text_formfield.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_elivated_button.dart';

class SigninPage extends StatelessWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("C-eM"),
      ),
      body: Container(
        padding: const EdgeInsets.all(40),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.6, 1.0],
                colors: [Colors.black, Color.fromARGB(255, 168, 22, 194)])),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            customFormField("email", false),
            const SizedBox(
              height: 10,
            ),
            customFormField("password", true),
            const SizedBox(
              height: 10,
            ),
            customElivatedButton("login"),
            const SizedBox(
              height: 5,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ValidatoinPage()));
              },
              child: const Text("Create new?"),
            ),

            const SizedBox(
              height: 5,
            ),
            // customElivatedButton("Create new?")
          ],
        ),
      ),
    );
  }
}
