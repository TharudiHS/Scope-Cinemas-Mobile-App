import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scope_cinemas/components/main_button.dart';
import 'package:scope_cinemas/screens/forget_password.dart';
import 'package:scope_cinemas/screens/new_account_page.dart';
import 'package:scope_cinemas/utils/text_styles.dart';
import '../utils/app_colours.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final bool _obscurePassword = true;

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
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo
                Image.asset('assets/images/scope-cinemas-logo.png', height: 70),
                const SizedBox(height: 80),

                // Title
                const Text("LOGIN", style: TextStyles.size24SofiaPro),
                const SizedBox(height: 24),

                // Login form container
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(color: AppColours.deepIndigo),
                  child: Column(
                    children: [
                      // Email field
                      TextField(
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

                      const SizedBox(height: 16),

                      // Password field
                      TextField(
                        obscureText: _obscurePassword,
                        style: const TextStyle(color: AppColours.white),
                        decoration: InputDecoration(
                          label: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Password",
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

                          // eye icon
                          suffixIcon: IconButton(
                            icon: SvgPicture.asset(
                              'assets/images/eye.svg',
                              height: 13,
                              width: 8,
                              color: AppColours.white,
                            ),
                            onPressed: () {},
                          ),

                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColours.lightGrey),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: AppColours.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 12),

                // Forgot password
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgetPasswordPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyles.size14SofiaPro,
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // Login button
                MainButton(label: "LOGIN", onPressed: () {}),
                const SizedBox(height: 35),

                // Divider with OR
                Row(
                  children: [
                    const Expanded(
                      child: Divider(
                        color: AppColours.lightGrey,
                        thickness: 0.5,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "OR",
                        style: TextStyles.size14SofiaProlightGrey,
                      ),
                    ),
                    const Expanded(
                      child: Divider(
                        color: AppColours.lightGrey,
                        thickness: 0.5,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Social login buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        'assets/images/facebook.svg',
                        height: 24,
                        width: 24,
                      ),
                    ),
                    const SizedBox(width: 20),
                    InkWell(
                      onTap: () {},
                      child: SvgPicture.asset(
                        'assets/images/google.svg',
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),

                // Sign up text
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don’t have an account yet? ",
                      style: TextStyles.size14SofiaProwhite,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const NewAccountPage(),
                          ),
                        );
                      },
                      child: Text(
                        "CREATE NEW",
                        style: TextStyles.size14SofiaPro,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
