import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

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
    return ElevatedButton(
      onPressed: onpressed,
      child: Text(title),
      style: ElevatedButton.styleFrom(minimumSize: Size(80, 40)),
    );
  }
}
