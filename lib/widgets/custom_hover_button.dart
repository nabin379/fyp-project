import 'package:flutter/material.dart';

class HoverButton extends StatefulWidget {
  @override
  _HoverButtonState createState() => _HoverButtonState();
}

class _HoverButtonState extends State<HoverButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          _isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          _isHovered = false;
        });
      },
      child: ElevatedButton(
        onPressed: () {
          // Action on button press
          print('Button pressed');
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: _isHovered
              ? Colors.white
              : const Color.fromARGB(255, 221, 110, 240),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(
          'Add to List',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: _isHovered
                ? Colors.purple
                : Colors.white, // Change text color on hover
            fontSize: 15.0,
          ),
        ),
      ),
    );
  }
}
