import 'package:cem/screen/app_screen/screen/auth/providers/login_provider.dart';
import 'package:cem/screen/app_screen/screen/home.dart';
import 'package:cem/screen/app_screen/screen/validation_page.dart';
import 'package:cem/screen/mobile/Pages/home/ui/homepage.dart';
import 'package:cem/widgets/base_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _login(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final loginProvider = Provider.of<LoginProvider>(context, listen: false);
      await loginProvider.loginUser(
        _emailController.text.trim(),
        _passwordController.text.trim(),
      );

      if (loginProvider.user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const WelcomePage()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold( 
    appBar: AppBar(title: const Text("Academia Vendor Auction System",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),centerTitle: true,),
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
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              obscureText: false,
              controller: _emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter an email.";
                } else if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                    .hasMatch(value)) {
                  return 'Please enter a valid email address.';
                }
                return null;
              },
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "Email",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 95, 42, 199),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextFormField(
              obscureText: true,
              controller: _passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Vaisab, please enter your password.';
                } else if (value.length < 6) {
                  return 'Vaisab, password must be at least 6 characters.';
                }
                return null;
              },
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "Password",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 95, 42, 199),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            loginProvider.isLoading
                ? const CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: () => _login(context),
                    child: const Text("Login"),
                  ),
            const SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ValidatoinPage()),
                );
              },
              child: const Text("Create new?"),
            ),
             ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const WelcomePage()),
                );
              },
              child: const Text("Go directly to welcome page"),
            ),
           
          ],
        ),
      ),
    ),
        );
  }
}
