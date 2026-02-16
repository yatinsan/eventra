import 'package:flutter/material.dart';

class FieldTitle extends StatelessWidget {
  const FieldTitle(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title, style: TextStyle(color: Colors.black54));
  }
}
