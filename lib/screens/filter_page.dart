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
          Container(color: Colors.black.withOpacity(0.6)),

          // White bottom sheet card (smaller height)
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height:
                  MediaQuery.of(context).size.height * 0.45, // smaller height
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Scrollable content
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Header
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "FILTER BY",
                                style: TextStyles.size16SofiaPro,
                              ),
                              GestureDetector(
                                onTap: clearAll,
                                child: const Text(
                                  "CLEAR ALL",
                                  style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          const Divider(height: 1, color: Colors.black26),
                          const SizedBox(height: 16),

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
                              return GestureDetector(
                                onTap: () => toggleExperience(exp),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? AppColours.royalIndigo
                                        : Colors.transparent,
                                    border: Border.all(
                                      color: isSelected
                                          ? AppColours.royalIndigo
                                          : Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    exp,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: isSelected
                                          ? Colors.white
                                          : AppColours.darkBlue,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),

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
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedLocation = loc;
                                  });
                                },
                                child: Container(
                                  width: double.infinity,
                                  margin: const EdgeInsets.only(bottom: 10),
                                  padding: const EdgeInsets.all(14),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? AppColours.royalIndigo
                                        : Colors.transparent,
                                    border: Border.all(
                                      color: AppColours.royalIndigo,
                                    ),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    loc,
                                    style: TextStyle(
                                      color: isSelected
                                          ? Colors.white
                                          : AppColours.darkBlue,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),

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
                              return GestureDetector(
                                onTap: () => toggleLanguage(lang),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? AppColours.royalIndigo
                                        : Colors.transparent,
                                    border: Border.all(
                                      color: isSelected
                                          ? AppColours.royalIndigo
                                          : Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Text(
                                    lang,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: isSelected
                                          ? Colors.white
                                          : AppColours.darkBlue,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Apply Button (always visible at bottom)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColours.royalIndigo,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
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
