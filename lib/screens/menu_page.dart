import 'package:flutter/material.dart';
import 'package:scope_cinemas/components/app_bar.dart';
import 'package:scope_cinemas/components/bottom_bar.dart';
import 'package:scope_cinemas/screens/loyalty_points_page.dart';
import 'package:scope_cinemas/screens/offers_competitions_page.dart';
import 'package:scope_cinemas/screens/settings_page.dart';
import 'package:scope_cinemas/utils/app_colours.dart';
import 'package:scope_cinemas/utils/text_styles.dart';
import 'package:scope_cinemas/screens/reservations_page.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.darkBlue,
      appBar: const CustomAppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        children: [
          const Text("MENU", style: TextStyles.size24SofiaPro),
          const SizedBox(height: 10),
          Container(height: 1, color: AppColours.royalIndigo.withOpacity(0.7)),
          const SizedBox(height: 25),
          _menuTile(context, "Offers & Competitions"),
          _menuTile(context, "My Reservations"),
          _menuTile(context, "My Loyalty Points"),
          _menuTile(context, "About Us", isExternal: true),
          _menuTile(context, "Experiences", isExternal: true),
          _menuTile(context, "Scope Privilege", isExternal: true),
          _menuTile(context, "Gift Cards", isExternal: true),
          _menuTile(context, "Contact Us", isExternal: true),
          _menuTile(context, "Settings"),
          _menuTile(context, "Log Out"),
          const SizedBox(height: 30),

          const SizedBox(height: 10),
          Center(
            child: Column(
              children: [
                const Text(
                  "©2025 Scope Cinemas",
                  style: TextStyles.size12SofiaPro,
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Terms & Conditions",
                      style: TextStyles.size12SofiaProcrimsonRed,
                    ),
                    SizedBox(width: 15),
                    Text("FAQs", style: TextStyles.size12SofiaProcrimsonRed),
                  ],
                ),
                const SizedBox(height: 16),
                Image.asset(
                  "assets/images/scope-cinemas-logo.png",
                  height: 50,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 20),
                const Text(
                  "Developed by Archmage Solutions",
                  style: TextStyles.size10SofiaPro,
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 4),
    );
  }

  // menu tile widget
  Widget _menuTile(
    BuildContext context,
    String title, {
    bool isExternal = false,
  }) {
    return Column(
      children: [
        ListTile(
          dense: true,
          contentPadding: EdgeInsets.zero,
          title: Text(title, style: TextStyles.size16SofiaProwhite),
          trailing: isExternal
              ? const Icon(
                  Icons.open_in_new,
                  size: 16,
                  color: AppColours.goldenYellow,
                )
              : null,
          onTap: () {
            if (title == "My Reservations") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ReservationsPage(),
                ),
              );
            } else if (title == "My Loyalty Points") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LoyaltyPointsPage(),
                ),
              );
            } else if (title == "Settings") {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsPage()),
              );
            } else if (title == "Experiences") {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const OffersCompetitionsPage(),
                ),
              );
            }
          },
        ),
        const Divider(color: AppColours.deepIndigo, thickness: 0.5),
      ],
    );
  }
}
