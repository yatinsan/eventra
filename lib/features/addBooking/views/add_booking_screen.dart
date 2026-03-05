import 'package:events/features/addBooking/controller/add_booking_controller.dart';
import 'package:events/features/addBooking/views/add_booking_amount_bottom_sheet.dart';
import 'package:events/shared/widgets/field_title.dart';
import 'package:events/shared/widgets/overlay_circle.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class AddBookingScreen extends StatelessWidget {
  const AddBookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<AddBookingController>();

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) async {
        if (didPop) {
          return;
        }

        if (!controller.hasChanges) {
          Navigator.of(context).pop();
          return;
        }

        final res = await showDialog(
          context: context,
          builder: (context) => BookingDiscardDialog(),
        );
        if (res == true) {
          if (context.mounted) {
            Navigator.of(context).pop();
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("New Booking"),
          actions: [
            ElevatedButton(
              onPressed: () async {
                showCircle(context);
                final status = await controller.submit();
                removeCircle();
                if (status && context.mounted) {
                  showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return AddBookingAmountBottomSheet();
                    },
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                visualDensity: VisualDensity(vertical: -2),
              ),
              child: const Text("Save"),
            ),
            Gap(16),
          ],
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(16),
              FieldTitle("Title"),
              Gap(8),
              TextField(
                controller: controller.titleController,
                decoration: InputDecoration(hintText: "Enter event title"),
              ),
              Gap(16),
              FieldTitle("Start Date"),
              Gap(8),
              TextField(
                readOnly: true,
                controller: controller.dateController,
                onTap: () => controller.pickDate(context),
                decoration: InputDecoration(
                  hintText: "Select date",
                  suffixIcon: Icon(Icons.calendar_today),
                ),
              ),
              Gap(16),
              FieldTitle("Phone number"),
              Gap(8),
              TextField(
                controller: controller.phoneController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(hintText: "Enter phone number"),
              ),
              Gap(16),
              FieldTitle("Hall"),
              Gap(8),
              Consumer<AddBookingController>(
                builder: (context, controller, child) {
                  return DropdownButtonFormField<String>(
                    initialValue: controller.selectedHall,
                    items: controller.halls
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (value) => controller.setHall(value),
                    decoration: InputDecoration(hintText: "Select hall"),
                  );
                },
              ),
              Gap(16),
              FieldTitle("Slot"),
              Gap(8),
              Consumer<AddBookingController>(
                builder: (context, controller, child) {
                  return DropdownButtonFormField<String>(
                    initialValue: controller.selectedSlot,
                    items: controller.slots
                        .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                        .toList(),
                    onChanged: (value) => controller.setSlot(value),
                    decoration: InputDecoration(hintText: "Select slot"),
                  );
                },
              ),
              Gap(16),
              Divider(),
              Gap(16),
              FieldTitle("Additional Note"),
              Gap(8),
              TextField(
                controller: controller.noteController,
                maxLines: 4,
                decoration: InputDecoration(hintText: "Type something..."),
              ),
              Gap(16),
            ],
          ),
        ),
      ),
    );
  }
}

class BookingDiscardDialog extends StatelessWidget {
  const BookingDiscardDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text("Discard changes?"),
      content: Text("Are you sure you want to discard this new event?"),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(true);
          },
          child: Text("Discard"),
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.red,
            visualDensity: VisualDensity(vertical: -2),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Continue Editing"),
          style: ElevatedButton.styleFrom(
            visualDensity: VisualDensity(vertical: -2),
          ),
        ),
      ],
    );
  }
}
