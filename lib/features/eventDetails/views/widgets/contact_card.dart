import 'package:events/config/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(child: Text("+91 888888888", style: AppTextStyle.bodyLarge)),
          IconButton(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: "+91 888888888"));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Copied to clipboard")),
              );
            },
            icon: const Icon(Icons.copy),
          ),
        ],
      ),
    );
  }
}
