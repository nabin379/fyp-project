import 'package:flutter/material.dart';

class FourTextFields extends StatelessWidget {
  const FourTextFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Left alignment

      children: [
        SizedBox(
          width: 30,
          child: TextFormField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              labelText: 'Text Input',
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                    color: Colors.black, width: 2.0), // Bold black outline
              ),
            ),
          ),
        ),
        SizedBox(
          width: 30,
          child: TextFormField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              labelText: 'Number Input',
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 2.0),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 30,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email Input',
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 2.0),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 30,
          child: TextFormField(
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
              labelText: 'Phone Input',
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.black, width: 2.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
