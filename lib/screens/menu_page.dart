import 'package:flutter/material.dart';
import 'package:scope_cinemas/components/app_bar.dart';
import 'package:scope_cinemas/components/bottom_bar.dart';
import 'package:scope_cinemas/utils/app_colours.dart';
import 'package:scope_cinemas/utils/text_styles.dart';

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
          _menuTile("Offers & Competitions"),
          _menuTile("My Reservations"),
          _menuTile("My Loyalty Points"),
          _menuTile("About Us", isExternal: true),
          _menuTile("Experiences", isExternal: true),
          _menuTile("Scope Privilege", isExternal: true),
          _menuTile("Gift Cards", isExternal: true),
          _menuTile("Contact Us", isExternal: true),
          _menuTile("Settings"),
          _menuTile("Log Out"),
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
  Widget _menuTile(String title, {bool isExternal = false}) {
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
          onTap: () {},
        ),
        const Divider(color: AppColours.deepIndigo, thickness: 0.5),
      ],
    );
  }
}
