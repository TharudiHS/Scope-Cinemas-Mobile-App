import 'package:flutter/material.dart';
import 'package:scope_cinemas/utils/app_colours.dart';
import 'package:scope_cinemas/utils/text_styles.dart';
import 'package:scope_cinemas/components/bottom_bar.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final List<String> experiences = [
    "IMAX 3D",
    "IMAX 2D",
    "DIRECTOR'S LOUNGE",
    "GOLD CLASS",
    "CINEMA ON DEMAND",
    "DOLBY ATMOS",
  ];

  final List<String> locations = [
    "Scope Cinemas Multiplex - Colombo City Centre",
    "Liberty by Scope Cinemas - Colpetty",
    "Scope Cinemas - Havelock City Mall",
    "Liberty by Scope Cinemas - Kiribathgoda",
  ];

  final List<String> languages = ["English", "Sinhala", "Tamil"];

  String selectedLocation = "";
  final List<String> selectedExperiences = [];
  final List<String> selectedLanguages = [];

  void toggleExperience(String exp) {
    setState(() {
      if (selectedExperiences.contains(exp)) {
        selectedExperiences.remove(exp);
      } else {
        selectedExperiences.add(exp);
      }
    });
  }

  void toggleLanguage(String lang) {
    setState(() {
      if (selectedLanguages.contains(lang)) {
        selectedLanguages.remove(lang);
      } else {
        selectedLanguages.add(lang);
      }
    });
  }

  void clearAll() {
    setState(() {
      selectedExperiences.clear();
      selectedLanguages.clear();
      selectedLocation = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Background
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/filter_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Dark overlay
          Container(color: Colors.black.withOpacity(0.9)),

          // White bottom sheet card
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.55,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Header
                  Column(
                    children: [
                      Container(
                        height: 3,
                        width: 148,
                        decoration: BoxDecoration(
                          color: AppColours.goldenYellow,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        margin: const EdgeInsets.only(bottom: 12),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "FILTER BY",
                            style: TextStyles.size20SofiaPro,
                          ),
                          GestureDetector(
                            onTap: clearAll,
                            child: Text(
                              "CLEAR ALL",
                              style: TextStyles.size16SofiaProcrimsonred
                                  .copyWith(
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColours.crimsonRed,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),
                  const Divider(height: 1, color: AppColours.royalIndigo),
                  const SizedBox(height: 16),

                  // Scrollable filter sections
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Experience Section
                          const Text(
                            "Experience",
                            style: TextStyles.size16SofiaPro,
                          ),
                          const SizedBox(height: 12),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: experiences.map((exp) {
                              final isSelected = selectedExperiences.contains(
                                exp,
                              );
                              return FilterOptionBox(
                                label: exp,
                                isSelected: isSelected,
                                onTap: () => toggleExperience(exp),
                              );
                            }).toList(),
                          ),

                          const SizedBox(height: 20),
                          const Divider(height: 1, color: AppColours.paleLilac),
                          const SizedBox(height: 20),

                          // Location Section
                          const Text(
                            "Location",
                            style: TextStyles.size16SofiaPro,
                          ),
                          const SizedBox(height: 12),
                          Column(
                            children: locations.map((loc) {
                              final isSelected = selectedLocation == loc;
                              return FilterOptionBox(
                                label: loc,
                                isSelected: isSelected,
                                isFullWidth: true,
                                onTap: () {
                                  setState(() {
                                    selectedLocation = loc;
                                  });
                                },
                              );
                            }).toList(),
                          ),

                          const SizedBox(height: 20),
                          const Divider(height: 1, color: AppColours.paleLilac),
                          const SizedBox(height: 20),

                          // Language Section
                          const Text(
                            "Language",
                            style: TextStyles.size16SofiaPro,
                          ),
                          const SizedBox(height: 12),
                          Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            children: languages.map((lang) {
                              final isSelected = selectedLanguages.contains(
                                lang,
                              );
                              return FilterOptionBox(
                                label: lang,
                                isSelected: isSelected,
                                onTap: () => toggleLanguage(lang),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Apply Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColours.royalIndigo,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        "APPLY",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // Bottom navigation bar
      bottomNavigationBar: const BottomNavBar(selectedIndex: 1),
    );
  }
}

//widget for filter option boxes
class FilterOptionBox extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final bool isFullWidth;

  const FilterOptionBox({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.isFullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: isFullWidth ? double.infinity : null,
        height: isFullWidth ? 45 : null,
        margin: isFullWidth
            ? const EdgeInsets.only(bottom: 5)
            : const EdgeInsets.all(0),
        padding: isFullWidth
            ? const EdgeInsets.all(14)
            : const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        decoration: BoxDecoration(
          color: isSelected ? AppColours.royalIndigo : Colors.transparent,
          border: Border.all(
            color: isSelected ? AppColours.royalIndigo : AppColours.white,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : AppColours.royalIndigo,
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
