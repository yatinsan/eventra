import 'package:events/config/theme/app_colors.dart';
import 'package:events/features/bookings/views/bookings_screen.dart';
import 'package:events/features/profile/views/profile_screen.dart';
import 'package:events/gen/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 1;

  final List<Widget> _screens = [
    const Center(child: Text("Home")),
    const BookingsScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 20,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildNavItem(0, Assets.icons.icNavHome.path, "Home"),
              _buildNavItem(1, Assets.icons.icNavCalander.path, "Bookings"),
              _buildNavItem(2, Assets.icons.icNavProfile.path, "Profile"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, String icon, String label) {
    bool isSelected = _currentIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          _currentIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: EdgeInsets.symmetric(
          horizontal: isSelected ? 20 : 12,
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.secondary : Colors.transparent,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              icon,
              colorFilter: ColorFilter.mode(
                isSelected ? Colors.white : AppColors.gray400,
                BlendMode.srcIn,
              ),
            ),
            // Icon(
            //   icon,
            //   color: isSelected ? Colors.white : AppColors.gray200,
            //   size: 24,
            // ),
            const Gap(8),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.white : AppColors.gray400,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
