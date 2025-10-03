import 'package:flutter/material.dart';
import 'package:scope_cinemas/components/app_bar.dart';
import 'package:scope_cinemas/components/bottom_bar.dart';
import 'package:scope_cinemas/screens/change_password.dart';
import 'package:scope_cinemas/screens/edit_profile.dart';
import 'package:scope_cinemas/utils/app_colours.dart';
import 'package:scope_cinemas/utils/text_styles.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.darkBlue,
      appBar: const CustomAppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        children: [
          // Page title
          const Text("SETTINGS", style: TextStyles.size24SofiaPro),
          const SizedBox(height: 10),
          Container(height: 1, color: AppColours.royalIndigo.withOpacity(0.7)),
          const SizedBox(height: 25),

          // Account Information Section
          const Text(
            "Account Information",
            style: TextStyles.size17SofiaProwhitelight,
          ),
          const SizedBox(height: 30),

          _infoRow("First Name:", "Kanchani"),
          _infoRow("Surname:", "Rathnayake"),
          _infoRow("Email Address:", "kanchanirathnayake@gmail.com"),
          _infoRow("Mobile Number:", "072 183 1712"),
          _infoRow("Gender:", "Female"),
          _infoRow("NIC Number:", "-"),
          _infoRow("Address:", "-"),

          const SizedBox(height: 50),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const EditProfilePage(),
                ),
              );
            },
            child: Text(
              "EDIT PROFILE",
              style: TextStyles.size16SofiaProcrimsonred.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: AppColours.crimsonRed,
              ),
            ),
          ),

          const SizedBox(height: 55),

          // Account Privacy
          const Text("Account Privacy", style: TextStyles.size14SofiaProwhite),
          const SizedBox(height: 25),
          _infoRow("Password:", "***********"),

          const SizedBox(height: 35),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChangePasswordPage(),
                ),
              );
            },
            child: Text(
              "CHANGE PASSWORD",
              style: TextStyles.size16SofiaProcrimsonred.copyWith(
                decoration: TextDecoration.underline,
                decorationColor: AppColours.crimsonRed,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 4),
    );
  }

  // Reusable row widget for info fields
  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(label, style: TextStyles.size14SofiaProwhite),
          ),
          Expanded(
            child: Text(
              value,
              style: TextStyles.size14SofiaProwhite,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
