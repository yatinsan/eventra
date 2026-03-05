import 'package:events/shared/widgets/field_title.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class AddBookingAmountBottomSheet extends StatelessWidget {
  const AddBookingAmountBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Details"),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              visualDensity: VisualDensity(vertical: -2),
            ),
            child: const Text("Done"),
          ),
          Gap(20),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            FieldTitle("Total Amount", isRequired: true),
            Gap(8),
            TextField(
              decoration: InputDecoration(hintText: "Enter the amount"),
            ),
            Gap(16),
            FieldTitle("Total Amount"),
            Gap(8),
            TextField(decoration: InputDecoration(hintText: "Advance Paid")),
            Gap(16),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
