import 'package:flutter/material.dart';
import 'package:scope_cinemas/components/app_bar.dart';
import 'package:scope_cinemas/components/bottom_bar.dart';
import 'package:scope_cinemas/components/main_button.dart';
import 'package:scope_cinemas/screens/settings_page.dart';
import 'package:scope_cinemas/utils/app_colours.dart';
import 'package:scope_cinemas/utils/text_styles.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController firstNameController = TextEditingController(
    text: "Kanchani",
  );
  final TextEditingController surnameController = TextEditingController(
    text: "Rathnayake",
  );
  final TextEditingController emailController = TextEditingController(
    text: "kanchanirathnayake@gmail.com",
  );
  final TextEditingController mobileController = TextEditingController(
    text: "072 183 1712",
  );
  final TextEditingController nicController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  String gender = "Female";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.darkBlue,
      appBar: const CustomAppBar(),

      // deep indigo header row
      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: AppColours.deepIndigo,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
            child: Row(
              children: [
                // Back Button
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
                  "UPDATE PERSONAL INFO.",
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
                const Text(
                  "Account Information",
                  style: TextStyles.size17SofiaProwhitelight,
                ),
                const SizedBox(height: 16),

                _buildTextField(controller: firstNameController),
                _buildTextField(controller: surnameController),
                _buildTextField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                ),
                _buildTextField(
                  controller: mobileController,
                  keyboardType: TextInputType.phone,
                ),

                const SizedBox(height: 8),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text("Gender", style: TextStyles.size14SofiaProwhite),
                    const SizedBox(width: 16),
                    Row(
                      children: [
                        Radio<String>(
                          value: "Male",
                          groupValue: gender,
                          activeColor: AppColours.goldenYellow,
                          onChanged: (val) {
                            setState(() => gender = val!);
                          },
                        ),
                        const Text(
                          "Male",
                          style: TextStyles.size14SofiaProwhite,
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Row(
                      children: [
                        Radio<String>(
                          value: "Female",
                          groupValue: gender,
                          activeColor: AppColours.goldenYellow,
                          onChanged: (val) {
                            setState(() => gender = val!);
                          },
                        ),
                        const Text(
                          "Female",
                          style: TextStyles.size14SofiaProwhite,
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                _buildTextField(controller: nicController, hint: "NIC number"),
                _buildTextField(controller: addressController, hint: "Address"),

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
            // Save profile button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: MainButton(
                label: "SAVE PROFILE",
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

            // bottom navigation
            const BottomNavBar(selectedIndex: 4),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    String? hint,
    TextInputType? keyboardType,
  }) {
    final bool hasText = controller.text.isNotEmpty;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        style: hasText
            ? TextStyles.size16SofiaProwhitelight
            : TextStyles.size14SofiaProlightGrey,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyles.size14SofiaProlightGrey,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 12),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
