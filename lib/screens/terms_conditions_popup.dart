import 'package:flutter/material.dart';
import 'package:scope_cinemas/utils/app_colours.dart';
import 'package:scope_cinemas/utils/text_styles.dart';

class TermsConditionsPopup {
  static Future<void> show(BuildContext context) async {
    bool isAgreeActive = false;

    await showDialog(
      context: context,
      barrierDismissible: false,
      barrierColor: Colors.black,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              insetPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 40,
              ),
              backgroundColor: Colors.white,
              child: SizedBox(
                height: 900,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 15,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Title & Close Icon
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(width: 20),
                          const Text(
                            "SCOPE CINEMAS\nTERMS AND CONDITIONS",
                            textAlign: TextAlign.center,
                            style: TextStyles.size24SofiaProdarkBlue,
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: const Icon(Icons.close, color: Colors.black),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      const Divider(color: AppColours.royalIndigo, height: 1),
                      const SizedBox(height: 22),

                      // Terms list
                      SizedBox(
                        height: 450,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              _TermItem(
                                text:
                                    "The website is for personal use only. Do not use it for commercial purposes or in any way that is unlawful or harmful.",
                              ),
                              _TermItem(
                                text:
                                    "All payments are subject to the terms and conditions of each bank. We do not retain your payment details.",
                              ),
                              _TermItem(
                                text:
                                    "All sales are final. No cancellations, exchanges, or re-bookings will be accepted.",
                              ),
                              _TermItem(
                                text:
                                    "Scope Cinemas reserves the right to not screen a movie due to unavoidable circumstances. In such cases, refunds will be made to valid ticket holders.",
                              ),
                              _TermItem(
                                text:
                                    "No food or beverage from outside is permitted at the cinema premises.",
                              ),
                              _TermItem(
                                text:
                                    "It is your responsibility to ensure that you carry the original booking receipt to the theater.",
                              ),
                              _TermItem(
                                text:
                                    "The laws of the Republic of Sri Lanka govern these terms and conditions.",
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 50),

                      // Buttons Row
                      Row(
                        children: [
                          Expanded(
                            child: OutlinedButton(
                              onPressed: () => Navigator.pop(context),
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                  color: AppColours.royalIndigo,
                                ),
                                shape: const RoundedRectangleBorder(),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                              ),
                              child: const Text(
                                "CANCEL",
                                style: TextStyles.size16SofiaPromedium,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() => isAgreeActive = true);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: isAgreeActive
                                    ? AppColours.royalIndigo
                                    : AppColours.grey,
                                shape: const RoundedRectangleBorder(),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                              ),
                              child: const Text(
                                "AGREE",
                                style: TextStyles.size16SofiaProwhite,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}

class _TermItem extends StatelessWidget {
  final String text;
  const _TermItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 6),
            child: Icon(Icons.circle, color: Colors.red, size: 8),
          ),
          const SizedBox(width: 10),
          Expanded(child: Text(text, style: TextStyles.size14SofiaProdarkBlue)),
        ],
      ),
    );
  }
}
