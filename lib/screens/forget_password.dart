import 'package:flutter/material.dart';
import '../utils/app_colours.dart';
import 'login_page.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scope_cinemas/components/main_button.dart';
import 'package:scope_cinemas/utils/text_styles.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({super.key});

  @override
  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [AppColours.darkBlue, AppColours.navyBlue],
          ),
        ),
        child: Column(
          children: [
            // Logo at the top
            Padding(
              padding: const EdgeInsets.only(top: 80, bottom: 20),
              child: Image.asset(
                'assets/images/scope-cinemas-logo.png',
                height: 70,
              ),
            ),
            const SizedBox(height: 70),

            // Scrollable content below
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Title
                    const Text(
                      "FORGOT YOUR PASSWORD?",
                      style: TextStyles.size24SofiaPro,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 24),

                    // Subtitle
                    const Text(
                      "Enter your email address and we will send you a link to reset your password.",
                      style: TextStyles.size14SofiaProwhite,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 30),

                    // Email input field
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(color: AppColours.deepIndigo),
                      child: TextField(
                        style: const TextStyle(color: AppColours.white),
                        decoration: InputDecoration(
                          label: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Email address",
                                  style: TextStyles.size17SofiaPro.copyWith(
                                    color: AppColours.white,
                                  ),
                                ),
                                const TextSpan(
                                  text: " *",
                                  style: TextStyle(color: Colors.red),
                                ),
                              ],
                            ),
                          ),
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(12),
                            child: SvgPicture.asset(
                              'assets/images/email.svg',
                              height: 7,
                              width: 7,
                              color: AppColours.white,
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
                    ),
                    const SizedBox(height: 30),

                    // Send reset link button
                    MainButton(label: "SEND RESET LINK", onPressed: () {}),

                    const SizedBox(height: 20),

                    // Back to login
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/images/arrow_back.png",
                            width: 20,
                            height: 20,
                            color: AppColours.crimsonRed,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            "Back to Login",
                            style: TextStyles.size14SofiaPro.copyWith(
                              color: AppColours.crimsonRed,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColours.crimsonRed,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
