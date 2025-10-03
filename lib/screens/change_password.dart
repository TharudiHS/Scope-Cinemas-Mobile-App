import 'package:flutter/material.dart';
import 'package:scope_cinemas/components/app_bar.dart';
import 'package:scope_cinemas/components/bottom_bar.dart';
import 'package:scope_cinemas/components/main_button.dart';
import 'package:scope_cinemas/screens/settings_page.dart';
import 'package:scope_cinemas/utils/app_colours.dart';
import 'package:scope_cinemas/utils/text_styles.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.darkBlue,
      appBar: const CustomAppBar(),

      body: Column(
        children: [
          // deep indigo header row
          Container(
            width: double.infinity,
            color: AppColours.deepIndigo,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
            child: Row(
              children: [
                // Back button
                IconButton(
                  icon: Image.asset(
                    "assets/images/arrow_back.png",
                    width: 30,
                    height: 30,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SettingsPage(),
                      ),
                    );
                  },
                ),

                const Spacer(),

                // Title
                const Text(
                  "CHANGE PASSWORD",
                  style: TextStyles.size16SofiaProwhite,
                ),

                const Spacer(),

                const SizedBox(width: 50),
              ],
            ),
          ),

          // Page content
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
              children: [
                const Text("New Password", style: TextStyles.size17SofiaPro),
                const SizedBox(height: 20),
                _buildPasswordField(
                  controller: newPasswordController,
                  hint: "Password *",
                ),

                const SizedBox(height: 50),

                const Text(
                  "Confirm Password",
                  style: TextStyles.size17SofiaPro,
                ),
                const SizedBox(height: 20),
                _buildPasswordField(
                  controller: newPasswordController,
                  hint: "Confirm Password *",
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),

      // Save button + bottom nav
      bottomNavigationBar: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: MainButton(
                label: "SAVE CHANGES",
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsPage(),
                    ),
                  );
                },
              ),
            ),
            const BottomNavBar(selectedIndex: 4),
          ],
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required TextEditingController controller,
    String? hint,
  }) {
    return TextField(
      controller: controller,
      obscureText: true,
      style: controller.text.isNotEmpty
          ? TextStyles.size16SofiaProwhitelight
          : TextStyles.size14SofiaProlightGrey,
      decoration: InputDecoration(
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 12),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        hintStyle: TextStyles.size16SofiaProwhitelight,

        hint: RichText(
          text: TextSpan(
            text: hint?.replaceAll("*", ""),
            style: TextStyles.size16SofiaProwhitelight,
            children: const [
              TextSpan(
                text: " *",
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
