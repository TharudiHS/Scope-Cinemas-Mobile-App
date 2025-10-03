// lib/screens/movies_page.dart
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:scope_cinemas/components/app_bar.dart';
import 'package:scope_cinemas/components/bottom_bar.dart';
import 'package:scope_cinemas/components/button.dart';
import 'package:scope_cinemas/screens/movie_details_page.dart';
import 'package:scope_cinemas/utils/app_colours.dart';
import 'package:scope_cinemas/utils/text_styles.dart';
import 'package:scope_cinemas/data/models/movie_model.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({super.key});

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  bool _showFilter = false;

  @override
  Widget build(BuildContext context) {
    // Selected movies
    final selectedMovies = movies
        .where(
          (m) => [
            "AKASA KUSUM",
            "LILO & STITCH",
            "FINAL DESTINATION",
            "BHOOTNII",
            "RANI (SINHALA)",
            "MINECRAFT",
            "MISSION IMPOSSIBLE",
            "GANGERS (TAMIL)",
          ].contains(m.title),
        )
        .toList();

    return Scaffold(
      backgroundColor: AppColours.darkBlue,
      appBar: const CustomAppBar(),
      body: Stack(
        children: [
          //  Main page
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Title Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("NOW SHOWING", style: TextStyles.size24SofiaPro),
                        const SizedBox(width: 6),
                        Image.asset(
                          "assets/images/arrow-54.png",
                          height: 20,
                          width: 20,
                          color: Colors.white,
                        ),
                      ],
                    ),

                    /// Filter Button
                    IconButton(
                      icon: const Icon(Icons.tune, color: Colors.white),
                      onPressed: () => setState(() => _showFilter = true),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  height: 1,
                  color: AppColours.royalIndigo.withOpacity(0.7),
                ),
                const SizedBox(height: 25),

                /// Movies Grid
                Expanded(
                  child: GridView.builder(
                    itemCount: selectedMovies.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 16,
                          childAspectRatio: 0.55,
                        ),
                    itemBuilder: (context, index) {
                      final movie = selectedMovies[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const MovieDetailsPage(),
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// Poster with gradient overlay
                            Expanded(
                              child: Stack(
                                children: [
                                  ClipRRect(
                                    child: Image.asset(
                                      movie.imageUrl,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    right: 0,
                                    child: Container(
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                          colors: [
                                            Colors.black.withOpacity(0.7),
                                            Colors.transparent,
                                          ],
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            movie.title,
                                            style:
                                                TextStyles.size20SofiaProwhite,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                            movie.subtitle,
                                            style: TextStyles.size10SofiaPro,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                            Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => const MovieDetailsPage(),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: AppColours.darkBlue,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.zero,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 10,
                                  ),
                                ),
                                child: const Text(
                                  "BUY TICKETS",
                                  style: TextStyles.size16SofiaPro,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          if (_showFilter) ...[
            // Blur + dark background
            GestureDetector(
              onTap: () => setState(() => _showFilter = false),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 4, sigmaY: 3),
                child: Container(color: Colors.black.withOpacity(0.45)),
              ),
            ),
            // Filter sheet
            Align(
              alignment: Alignment.bottomCenter,
              child: FilterSheet(
                onApply: () => setState(() => _showFilter = false),
              ),
            ),
          ],
        ],
      ),

      bottomNavigationBar: const BottomNavBar(selectedIndex: 1),
    );
  }
}

// FilterSheet widget

class FilterSheet extends StatefulWidget {
  const FilterSheet({super.key, required void Function() onApply});

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
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
    return Material(
      color: Colors.transparent,
      child: SafeArea(
        top: false,
        child: Align(
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
                    const Text("FILTER BY", style: TextStyles.size20SofiaPro),
                    GestureDetector(
                      onTap: clearAll,
                      child: Text(
                        "CLEAR ALL",
                        style: TextStyles.size16SofiaProcrimsonred.copyWith(
                          decoration: TextDecoration.underline,
                          decorationColor: AppColours.crimsonRed,
                        ),
                      ),
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
                            final isSelected = selectedLanguages.contains(lang);
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
                CustomButton(
                  text: "APPLY",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// widget for filter option boxes
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
