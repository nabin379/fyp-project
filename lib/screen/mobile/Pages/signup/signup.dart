import 'package:cem/screen/mobile/Pages/login/login.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _LoginFormState();
}

class _LoginFormState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // Your leading icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Center(
            child: Text(
          'Sign Up ',
          style:
              TextStyle(fontSize: 17, color: Color.fromARGB(255, 83, 82, 82)),
        )),
      ),
      body: Center(
          child: Container(
        height: 530,
        width: 390,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: const Signup(),
      )),
    );
  }
  //Custom Widget
}

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _LoginState();
}

class _LoginState extends State<Signup> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController confirmpassword = TextEditingController();

  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: ListView(
          padding:
              const EdgeInsets.only(top: 15, bottom: 20, left: 40, right: 40),
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: TextFormField(
                controller: username,
                decoration: InputDecoration(
                    labelText: 'Username',
                    hintText: 'enter your username',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your username";
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: TextFormField(
                controller: password,
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15)),
                  labelText: 'Password',
                  hintText: 'enter your password',
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your password";
                  } else if (value.length < 8) {
                    return "Your password must be 8 characters or more";
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Expanded(
                child: TextFormField(
              controller: confirmpassword,
              obscureText: !_isConfirmPasswordVisible,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
                labelText: 'Confirm Password',
                hintText: 'Re-enter your password',
                suffixIcon: IconButton(
                  icon: Icon(
                    _isConfirmPasswordVisible
                        ? Icons.visibility
                        : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      _isConfirmPasswordVisible = !_isConfirmPasswordVisible;
                    });
                  },
                ),
              ),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Please enter your password";
                } else if (value.length < 8) {
                  return "Your password must be 8 characters or more";
                }
                return null;
              },
            )),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15))),
              child: const SizedBox(
                  height: 40,
                  width: 80,
                  child: Center(
                      child: Text(
                    'Sign up',
                    style: TextStyle(color: Colors.white),
                  ))),
            ),
          ],
        ));
  }
}
