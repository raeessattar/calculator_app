import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  String title;
  Color color;
  VoidCallback onPress;
  RoundButton({super.key, required this.title, this.color = const Color(0xffa5a5a5), required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onPress,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            height: 80,
            child: Center(child: Text(title, style: TextStyle(fontSize: 25, color: Colors.white),)),
            decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}

