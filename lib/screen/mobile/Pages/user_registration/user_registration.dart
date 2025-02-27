import 'package:cem/screen/mobile/Pages/signup/signup.dart';
import 'package:flutter/material.dart';

class UserRegistration extends StatefulWidget {
  const UserRegistration({super.key});

  @override
  State<UserRegistration> createState() => _LoginFormState();
}

class _LoginFormState extends State<UserRegistration> {
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
          'User Registration Form ',
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
  TextEditingController email = TextEditingController();
  TextEditingController firstname = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController officename = TextEditingController();

  //Regular expn for phone number validation
  final phoneNumberRegex = RegExp(r'^\+?([0-9]{1,4})?[-.●]?([0-9]{10})$');

  //Regular expn for email validation
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter an email';
    }
    String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  @override
  void dispose() {
    email.dispose();
    firstname.dispose();
    lastname.dispose();
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
                controller: firstname,
                decoration: InputDecoration(
                    labelText: 'First Name',
                    hintText: 'enter your first name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your first name";
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
                controller: lastname,
                decoration: InputDecoration(
                    labelText: 'Last Name',
                    hintText: 'enter your last name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your last name";
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
                  controller: email,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'enter your email',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15))),
                  keyboardType: TextInputType.emailAddress,
                  validator: validateEmail),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: TextFormField(
                controller: phone,
                decoration: InputDecoration(
                    labelText: 'Phone Number',
                    hintText: 'enter your phone number',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your phone number";
                  }
                  if (value.length < 10) {
                    return "Please enter a valid phone number";
                  }
                  if (value.length > 10) {
                    return "Please enter a valid phone number";
                  }
                  if (!phoneNumberRegex.hasMatch(value)) {
                    return 'Enter a valid phone number';
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
                controller: officename,
                decoration: InputDecoration(
                    labelText: 'Ofice Name',
                    hintText: 'enter your office name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter your office name";
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                if (_formkey.currentState!.validate()) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignupPage()),
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
                    'Next',
                    style: TextStyle(color: Colors.white),
                  ))),
            ),
          ],
        ));
  }
}
