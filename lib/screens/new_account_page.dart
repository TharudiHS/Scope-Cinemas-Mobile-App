import 'package:flutter/material.dart';
import 'package:scope_cinemas/components/main_button.dart';
import 'package:scope_cinemas/screens/login_page.dart';
import 'package:scope_cinemas/utils/text_styles.dart';
import '../utils/app_colours.dart';

class NewAccountPage extends StatefulWidget {
  const NewAccountPage({super.key});

  @override
  State<NewAccountPage> createState() => _NewAccountPageState();
}

class _NewAccountPageState extends State<NewAccountPage> {
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  String? gender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.darkBlue,
      appBar: AppBar(
        backgroundColor: AppColours.darkNavy,
        leading: IconButton(
          icon: Image.asset(
            "assets/images/arrow_back.png",
            width: 40,
            height: 40,
            color: Colors.white,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          "CREATE AN ACCOUNT",
          style: TextStyles.size20SofiaProwhitemedium,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 12),
            const Text(
              "Enter your details below to create a new account",
              style: TextStyles.size14SofiaProwhite,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),

            // Form container
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: AppColours.deepIndigo),
              child: Column(
                children: [
                  _buildTextField("First name", required: true),
                  _buildTextField("Surname", required: true),
                  _buildTextField("Email address", required: true),
                  _buildTextField("Mobile number", required: true),
                  _buildTextField(
                    "Date of birth",
                    suffixIcon: const Icon(
                      Icons.calendar_today,
                      color: AppColours.white,
                      size: 20,
                    ),
                  ),

                  const SizedBox(height: 12),
                  // Gender radio
                  Row(
                    children: [
                      const Text(
                        "Gender",
                        style: TextStyles.size14SofiaProwhite,
                      ),
                      const SizedBox(width: 20),
                      Row(
                        children: [
                          Radio<String>(
                            value: "Male",
                            groupValue: gender,
                            activeColor: AppColours.goldenYellow,
                            onChanged: (value) {
                              setState(() => gender = value);
                            },
                          ),
                          const Text(
                            "Male",
                            style: TextStyles.size14SofiaProwhite,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Radio<String>(
                            value: "Female",
                            groupValue: gender,
                            activeColor: AppColours.goldenYellow,
                            onChanged: (value) {
                              setState(() => gender = value);
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
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Password container
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: AppColours.deepIndigo),
              child: Column(
                children: [
                  _buildPasswordField("Password", _obscurePassword, () {
                    setState(() {
                      _obscurePassword = !_obscurePassword;
                    });
                  }),
                  _buildPasswordField(
                    "Confirm password",
                    _obscureConfirmPassword,
                    () {
                      setState(() {
                        _obscureConfirmPassword = !_obscureConfirmPassword;
                      });
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 80),

            // Already have account
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have an account? ",
                  style: TextStyles.size14SofiaProwhite,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  child: Text(
                    "Login",
                    style: TextStyles.size14SofiaPro.copyWith(
                      color: AppColours.crimsonRed,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColours.crimsonRed,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: MainButton(label: "CREATE A NEW ACCOUNT", onPressed: () {}),
      ),
    );
  }

  Widget _buildTextField(
    String label, {
    bool required = false,
    Widget? suffixIcon,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        style: const TextStyle(color: AppColours.white),
        decoration: InputDecoration(
          label: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: label,
                  style: TextStyles.size17SofiaPro.copyWith(
                    color: AppColours.white,
                  ),
                ),
                if (required)
                  const TextSpan(
                    text: " *",
                    style: TextStyle(color: AppColours.crimsonRed),
                  ),
              ],
            ),
          ),
          suffixIcon: suffixIcon != null
              ? Padding(padding: const EdgeInsets.all(12), child: suffixIcon)
              : null,
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColours.lightGrey),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColours.white),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField(
    String label,
    bool obscure,
    VoidCallback toggleVisibility,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: TextField(
        obscureText: obscure,
        style: const TextStyle(color: AppColours.white),
        decoration: InputDecoration(
          label: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: label,
                  style: TextStyles.size17SofiaPro.copyWith(
                    color: AppColours.white,
                  ),
                ),
                const TextSpan(
                  text: " *",
                  style: TextStyle(color: AppColours.crimsonRed),
                ),
              ],
            ),
          ),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColours.lightGrey),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: AppColours.white),
          ),
        ),
      ),
    );
  }
}
