import 'package:flutter/material.dart';

class BasicappButton extends StatelessWidget {
  final VoidCallback onpressed;
  final String title;

  const BasicappButton({
    super.key,
    required this.onpressed,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      borderRadius: BorderRadius.circular(30),
      child: ElevatedButton(
        onPressed: onpressed,
        style: ElevatedButton.styleFrom(minimumSize: Size(100, 60)),
        child: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
    );
  }
}
