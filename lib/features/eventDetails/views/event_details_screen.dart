import 'package:events/config/theme/app_colors.dart';
import 'package:events/features/eventDetails/views/widgets/contact_card.dart';
import 'package:events/features/eventDetails/views/widgets/event_delete_dialog.dart';
import 'package:events/features/eventDetails/views/widgets/event_header.dart';
import 'package:events/features/eventDetails/views/widgets/notes_section.dart';
import 'package:events/features/eventDetails/views/widgets/payment_summary_section.dart';
import 'package:events/features/eventDetails/views/widgets/venue_details_card.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking Details"),
        actions: [BookingDetailsMoreOption()],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            EventHeader(),
            Gap(16),
            ContactCard(),
            Gap(16),
            VenueDetailsCard(),
            Gap(16),
            NotesSection(),
            Gap(16),
            PaymentSummarySection(),
            Gap(32),
          ],
        ),
      ),
    );
  }
}

class BookingDetailsMoreOption extends StatelessWidget {
  const BookingDetailsMoreOption({super.key});

  PopupMenuItem menuItem({
    required String title,
    Widget? icon,
    VoidCallback? onTap,
  }) {
    return PopupMenuItem(
      onTap: onTap,
      padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      height: 40,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.gray200,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            if (icon != null) ...[icon, Gap(8)],
            Text(title),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      clipBehavior: Clip.hardEdge,
      offset: Offset(-20, 60),
      menuPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      itemBuilder: (context) => [
        menuItem(
          title: 'Edit',
          icon: Icon(Icons.edit, color: Colors.blue),
        ),
        menuItem(
          title: 'Delete',
          icon: Icon(Icons.delete, color: Colors.red),
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => EventDeleteDialog(),
            );
          },
        ),
      ],
    );
  }
}
