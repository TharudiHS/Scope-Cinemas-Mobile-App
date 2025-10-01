import 'package:flutter/material.dart';
import 'package:scope_cinemas/components/app_bar.dart';
import 'package:scope_cinemas/components/bottom_bar.dart';
import 'package:scope_cinemas/utils/app_colours.dart';
import 'package:scope_cinemas/utils/text_styles.dart';

class LoyaltyPointsPage extends StatelessWidget {
  const LoyaltyPointsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.darkBlue,
      appBar: const CustomAppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        children: [
          const Text("MY LOYALTY POINTS", style: TextStyles.size24SofiaPro),
          const SizedBox(height: 10),
          Container(height: 1, color: AppColours.royalIndigo.withOpacity(0.7)),
          const SizedBox(height: 25),

          // Scope Privilege Text
          const Text(
            "Scope Privilege",
            style: TextStyles.size17SofiaProwhitelight,
          ),
          const SizedBox(height: 20),

          // Membership details box
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: AppColours.deepIndigo),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  "Membership ID",
                  style: TextStyles.size16SofiaProwhitelight,
                ),
                SizedBox(height: 6),
                Text(
                  "SCOPEVHTHJYC38K",
                  style: TextStyles.size20SofiaProregular,
                ),
                SizedBox(height: 16),
                Text(
                  "Points Available",
                  style: TextStyles.size16SofiaProwhitelight,
                ),
                SizedBox(height: 6),
                Text("1806", style: TextStyles.size20SofiaProregular),
                SizedBox(height: 16),
                Text(
                  "Lifetime Earned Points",
                  style: TextStyles.size16SofiaProwhitelight,
                ),
                SizedBox(height: 6),
                Text("2808", style: TextStyles.size20SofiaProregular),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 4),
    );
  }
}
