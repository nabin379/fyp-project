import 'package:cem/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

ElevatedButton customElivatedButton(String btnText) {
  return ElevatedButton(onPressed: () {}, child: Text(btnText));
}

class AppButton extends StatelessWidget {
  final VoidCallback onpressed;
  const AppButton({
    super.key,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.primaryColor,
            foregroundColor: AppColor.sixthColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        child: const Text("Continue"));
  }
}

class NavButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  const NavButton({
    Key? key,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
