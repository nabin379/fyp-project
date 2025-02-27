import 'package:flutter/material.dart';

class BaseScaffold extends StatelessWidget {
  final Widget child;
  
  const BaseScaffold({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(40),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.6, 1.0],
            colors: [Colors.black, Color.fromARGB(255, 168, 22, 194)],
          ),
        ),
        child: child, // This will be your page content
      ),
    );
  }
}
