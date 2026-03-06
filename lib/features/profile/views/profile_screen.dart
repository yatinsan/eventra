import 'package:events/features/profile/views/widgets/complete_your_profile_section.dart';
import 'package:events/features/profile/views/widgets/hall_list_section_profile.dart';
import 'package:events/features/profile/views/widgets/profile_header.dart';
import 'package:events/features/profile/views/widgets/profile_info_section.dart';
import 'package:events/shared/app_bg_gradient.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBgGradient(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileHeader(),
            Gap(16),
            ProfileInfoSection(),

            Gap(16),
            ProfileContent(),
          ],
        ),
      ),
    );
  }
}

class ProfileContent extends StatelessWidget {
  const ProfileContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          CompleteYourProfileSection(),
          Gap(16),
          HallListSectionProfile(),
        ],
      ),
    );
  }
}
