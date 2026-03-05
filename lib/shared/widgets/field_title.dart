import 'package:flutter/material.dart';

class FieldTitle extends StatelessWidget {
  const FieldTitle(this.title, {super.key, this.isRequired = false});

  final String title;
  final bool isRequired;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(title, style: TextStyle(color: Colors.black54)),
        if (isRequired) Text("*", style: TextStyle(color: Colors.redAccent)),
      ],
    );
  }
}
