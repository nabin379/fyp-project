import 'package:cem/widgets/custom_validationpage.dart';
import 'package:flutter/material.dart';

class ValidatoinPage extends StatefulWidget {
  const ValidatoinPage({super.key});

  @override
  State<ValidatoinPage> createState() => _ValidationPageState();
}

class _ValidationPageState extends State<ValidatoinPage> {
  TextEditingController name = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController ofcname = TextEditingController();
  TextEditingController ofcaddress = TextEditingController();
  TextEditingController phno = TextEditingController();

  final List<String> groupValue = ["Male", "Female"];

  late String selectedGender = groupValue[0];
  // late modifier le chai jun bela variable  chaincha tei bela matra initialize

  @override
  void dispose() {
    name.dispose();
    address.dispose();
    ofcname.dispose();
    ofcaddress.dispose();

    super.dispose();
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
        child: ListView(
          children: [
            Column(
              children: [
                customValidationForm(
                  customHintText: "Name",
                  controller: name,
                ),
                const SizedBox(
                  height: 7.0,
                ),
                customValidationForm(
                  customHintText: "Address",
                  controller: address,
                ),
                const SizedBox(
                  height: 7.0,
                ),
                customValidationForm(
                  customHintText: "Citizenship No.",
                  controller: ofcname,
                  customkeyboardtype: TextInputType.number,
                ),
                const SizedBox(
                  height: 7.0,
                ),
                customValidationForm(
                    customHintText: "Ph No",
                    controller: phno,
                    customkeyboardtype: TextInputType.phone,
                    customPrefix: const Text("+977")),
                const SizedBox(
                  height: 10.0,
                ),
                customValidationForm(
                    customHintText: "Office Name",
                    controller: phno,
                    customkeyboardtype: TextInputType.name,
                    ),
                const SizedBox(
                  height: 10.0,
                ),
                customValidationForm(
                    customHintText: "PAN N.O.",
                    controller: phno,
                    customkeyboardtype: TextInputType.number,
                    ),
                const SizedBox(
                  height: 10.0,
                ),
                customValidationForm(
                    customHintText: "VAT N.O.",
                    controller: phno,
                    customkeyboardtype: TextInputType.phone,
                    ),
                const SizedBox(
                  height: 10.0,
                ),
                customValidationForm(
                    customHintText: "Email",
                    controller: phno,
                    customkeyboardtype: TextInputType.emailAddress,
                    ),
                const SizedBox(
                  height: 10.0,
                ),
                customValidationForm(
                    customHintText: "Date of Birth",
                    controller: phno,
                    customkeyboardtype: TextInputType.datetime,
                    ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(children: [
                  Row(children: [
                    Radio(
                        value: groupValue[0],
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value.toString();
                          });
                        }),
                    const Text(
                      "Male",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ]),
                  Row(children: [
                    Radio(
                        value: groupValue[1],
                        groupValue: selectedGender,
                        onChanged: (value) {
                          setState(() {
                            selectedGender = value.toString();
                          });
                        }),
                    const Text(
                      "Female",
                      style: TextStyle(color: Colors.white),
                    ),
                  ]),
                ]),
                ElevatedButton(
                    onPressed: () {
                      print("Your name is ${name}");
                    },
                    child: const Text("Submit")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("roll Back")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
