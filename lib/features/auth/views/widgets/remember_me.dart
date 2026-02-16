import 'package:events/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class RememberMeCheckBox extends StatefulWidget {
  const RememberMeCheckBox({super.key});

  @override
  State<RememberMeCheckBox> createState() => _RememberMeCheckBoxState();
}

class _RememberMeCheckBoxState extends State<RememberMeCheckBox> {
  bool _isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: _isCheck,
          onChanged: (value) {
            setState(() {
              _isCheck = !_isCheck;
            });
          },
          visualDensity: VisualDensity(horizontal: -2),
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          side: BorderSide(color: Colors.black54),
        ),
        Text(
          "Remember me",
          style: TextStyle(
            color: AppColors.gray600,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
