import 'package:cem/screen/app_screen/screen/registration_page.dart';
import 'package:cem/widgets/custom_text_formfield.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/custom_elivated_button.dart';

class AppWalkThrough extends StatefulWidget {
  @override
  State<AppWalkThrough> createState() => _AppWalkThroughState();
}

class _AppWalkThroughState extends State<AppWalkThrough> {
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void _login(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      final email = _emailcontroller.text.trim();
      final password = _passwordController.text.trim();

      if (email == 'user123@example.com' && password == 'user123') {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Password milena Samdhi')),
        );
      }
    }
  }

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
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                obscureText: false,
                controller: _emailcontroller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "vaisab please enter  email ";
                  } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                    return 'Vaisab enter valid email address';
                  }
                  return null;
                },

                ///makes pw invisible
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "email",
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
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormField(
                obscureText: true,
                controller: _passwordController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return ' Vaisab Please enter your password';
                  } else if (value.length < 6) {
                    return 'vaisab Password must be at least 6 characters';
                  }
                  return null;
                },

                ///makes pw invisible
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "password",
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
              ),
              const SizedBox(
                height: 10,
              ),
              // customElivatedButton("login"),

              ElevatedButton(
                  onPressed: () => _login(context), child: const Text("login")),
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
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("welcome King"),
      ),
    );
  }
}
