import 'package:events/features/eventDetails/views/widgets/contact_card.dart';
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
      appBar: AppBar(title: const Text("Booking Details")),
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
