import 'package:flutter/material.dart';
import 'package:scope_cinemas/components/button.dart';
import 'package:scope_cinemas/screens/payment_page.dart';
import 'package:scope_cinemas/utils/app_colours.dart';
import 'package:scope_cinemas/utils/text_styles.dart';

class SelectTicketTypePage extends StatefulWidget {
  const SelectTicketTypePage({super.key});

  @override
  State<SelectTicketTypePage> createState() => _SelectTicketTypePageState();
}

class _SelectTicketTypePageState extends State<SelectTicketTypePage> {
  String selectedOption = "M-Ticket";
  bool agreedToTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      body: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          width: double.infinity,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Close button
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.close, color: AppColours.darkBlue),
                  ),
                ],
              ),

              const SizedBox(height: 8),
              const Text(
                "SELECT TICKET TYPE",
                style: TextStyles.size24SofiaProdarkBlue,
              ),
              const SizedBox(height: 16),

              // Divider
              Container(
                height: 1,
                color: AppColours.royalIndigo.withOpacity(0.7),
              ),
              const SizedBox(height: 16),

              // M-Ticket Option
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedOption = "M-Ticket";
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: selectedOption == "M-Ticket"
                        ? AppColours.deepIndigo
                        : Colors.grey[100],
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 14,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        selectedOption == "M-Ticket"
                            ? Icons.radio_button_checked
                            : Icons.radio_button_off,
                        color: selectedOption == "M-Ticket"
                            ? AppColours.deepCrimson
                            : AppColours.deepCrimson,
                      ),
                      const SizedBox(width: 10),
                      Icon(
                        Icons.phone_iphone,
                        color: selectedOption == "M-Ticket"
                            ? Colors.white
                            : Colors.black54,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "M-Ticket",
                        style: TextStyle(
                          color: selectedOption == "M-Ticket"
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Box Office Pick-up Option
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedOption = "Box Office Pick-up";
                  });
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: selectedOption == "Box Office Pick-up"
                        ? const Color(0xFF1A1A50)
                        : Colors.grey[100],
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 14,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        selectedOption == "Box Office Pick-up"
                            ? Icons.radio_button_checked
                            : Icons.radio_button_off,
                        color: selectedOption == "Box Office Pick-up"
                            ? AppColours.deepCrimson
                            : AppColours.deepCrimson,
                      ),
                      const SizedBox(width: 10),
                      Icon(
                        Icons.confirmation_number,
                        color: selectedOption == "Box Office Pick-up"
                            ? Colors.black54
                            : Colors.black54,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "Box Office Pick-up",
                        style: TextStyle(
                          color: selectedOption == "Box Office Pick-up"
                              ? Colors.white
                              : Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // Terms & Conditions
              Row(
                children: [
                  Checkbox(
                    value: agreedToTerms,
                    onChanged: (value) {
                      setState(() {
                        agreedToTerms = value ?? false;
                      });
                    },
                    activeColor: AppColours.goldenYellow,
                  ),
                  const Text(
                    "I agree to the ",
                    style: TextStyles.size16SofiaPro,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Terms & Conditions",
                      style: TextStyles.size16SofiaProgolden,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 8),

              // Continue Button
              CustomButton(
                text: "CONTINUE TO PAY - LKR 7,225",
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PaymentPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
