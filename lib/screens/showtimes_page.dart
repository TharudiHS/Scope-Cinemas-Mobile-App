import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scope_cinemas/components/app_bar.dart';
import 'package:scope_cinemas/components/bottom_bar.dart';
import 'package:scope_cinemas/components/button.dart';
import 'package:scope_cinemas/data/models/showtimes_model.dart';
import 'package:scope_cinemas/screens/movie_details_page.dart';
import 'package:scope_cinemas/screens/select_seats.dart';
import 'package:scope_cinemas/utils/app_colours.dart';
import 'package:scope_cinemas/utils/text_styles.dart';

class ShowtimesPage extends StatefulWidget {
  const ShowtimesPage({super.key});

  @override
  State<ShowtimesPage> createState() => _ShowtimesPageState();
}

class _ShowtimesPageState extends State<ShowtimesPage> {
  bool _showFilter = false;

  @override
  Widget build(BuildContext context) {
    // Cinema data
    final cinemas = [
      Cinema("SCOPE CINEMAS MULTIPLEX - \nHAVELOCK CITY MALL", [
        CinemaFormat("IMAX", [
          ["10:30 AM", true, "3d"],
          ["10:30 AM", false, "3d_1"],
          ["10:30 AM", false, "2d"],
          ["10:30 AM", false, "3d_1"],
          ["10:30 AM", false, "3d_1"],
          ["10:30 AM", false, "3d_1"],
          ["10:30 AM", false, "3d_1"],
        ]),
        CinemaFormat("Dolby Atmos", [
          ["10:30 AM", true, "3d"],
          ["10:30 AM", false, "3d_1"],
          ["10:30 AM", false, "3d_1"],
          ["10:30 AM", false, "3d_1"],
          ["10:30 AM", false, "3d_1"],
          ["10:30 AM", false, "3d_1"],
          ["10:30 AM", false, "3d_1"],
        ]),
      ]),
      Cinema("SCOPE CINEMAS MULTIPLEX - \nCOLOMBO CITY CENTRE", [
        CinemaFormat("Dolby Atmos", [
          ["10:30 AM", true, "3d"],
          ["10:30 AM", false, "3d_1"],
          ["10:30 AM", false, "3d_1"],
          ["10:30 AM", false, "3d_1"],
          ["10:30 AM", false, "3d_1"],
          ["10:30 AM", false, "3d_1"],
          ["10:30 AM", false, "3d_1"],
        ]),
      ]),
      Cinema("LIBERTY BY SCOPE CINEMAS - \nCOLPETTY", [
        CinemaFormat("Dolby Atmos", [
          ["10:30 AM", true, "3d"],
          ["10:30 AM", false, "3d_1"],
          ["10:30 AM", false, "3d_1"],
          ["10:30 AM", false, "3d_1"],
          ["10:30 AM", false, "3d_1"],
          ["10:30 AM", false, "3d_1"],
        ]),
      ]),
      Cinema("LIBERTY BY SCOPE CINEMAS - \nKIRIBATHGODA", [
        CinemaFormat("Dolby Atmos", [
          ["10:30 AM", true, "3d"],
          ["10:30 AM", false, "3d_1"],
          ["10:30 AM", false, "3d_1"],
        ]),
      ]),
    ];

    return Scaffold(
      backgroundColor: AppColours.darkBlue,
      appBar: const CustomAppBar(),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 1),
      body: Stack(
        children: [
          Column(
            children: [
              _buildMovieHeader(context),
              _buildDateSelector(),
              Divider(color: AppColours.royalIndigo.withOpacity(0.7)),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      for (var i = 0; i < cinemas.length; i++) ...[
                        _buildCinemaSection(cinemas[i]),
                        if (i != cinemas.length - 1)
                          Divider(
                            color: AppColours.royalIndigo.withOpacity(0.7),
                          ),
                      ],
                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Filter overlay
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
    );
  }

  /// The bar under app bar
  Widget _buildMovieHeader(BuildContext context) {
    return Container(
      color: AppColours.deepIndigo,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      child: Row(
        children: [
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
                  builder: (context) => const MovieDetailsPage(),
                ),
              );
            },
          ),
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                ClipRRect(
                  child: Image.asset(
                    "assets/images/superman.png",
                    height: 40,
                    width: 28,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                Row(
                  children: [
                    Text("SUPERMAN", style: TextStyles.size16SofiaProwhite),
                    const SizedBox(width: 10),
                    Image.asset(
                      "assets/images/arrow-54.png",
                      height: 13,
                      width: 13,
                      color: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.tune, color: Colors.white),
            onPressed: () => setState(() => _showFilter = true),
          ),
        ],
      ),
    );
  }

  /// Date selector with ShowDate model
  Widget _buildDateSelector() {
    final dates = [
      ShowDate("FRI", "10", "JUN", true),
      ShowDate("SAT", "11", "JUN", false),
      ShowDate("SUN", "12", "JUN", false),
      ShowDate("MON", "13", "JUN", false),
      ShowDate("TUE", "14", "JUN", false),
      ShowDate("WED", "15", "JUN", false),
    ];

    return Container(
      color: AppColours.darkBlue,
      child: SizedBox(
        height: 95,
        child: Row(
          children: [
            for (var d in dates)
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 4,
                  ),
                  decoration: BoxDecoration(
                    color: d.selected
                        ? AppColours.deepCrimson
                        : Colors.transparent,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        d.day,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white.withOpacity(
                            d.selected ? 1.0 : 0.9,
                          ),
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.6,
                        ),
                      ),
                      const SizedBox(height: 6),
                      Text(
                        d.date,
                        style: const TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          height: 1.0,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        d.month,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white.withOpacity(
                            d.selected ? 1.0 : 0.9,
                          ),
                          fontWeight: FontWeight.w600,
                          letterSpacing: 0.6,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            Container(
              width: 35,
              margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 10),
              decoration: BoxDecoration(color: AppColours.darkNavy),
              child: const Center(
                child: Icon(Icons.chevron_right, color: Colors.white, size: 28),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Cinema section with IMAX / Dolby logos
  Widget _buildCinemaSection(Cinema cinema) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      child: Column(
        children: [
          // Cinema Name
          Text(
            cinema.cinemaName,
            style: TextStyles.size20SofiaProwhite,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),

          // Loop through formats (IMAX / Dolby)
          for (var format in cinema.formats)
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Container(
                width: 350,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(color: AppColours.deepIndigo),
                child: Column(
                  children: [
                    // Format Logo (IMAX or Dolby)
                    Image.asset(
                      format.formatName == "IMAX"
                          ? "assets/images/imax.png"
                          : "assets/images/dolby.png",
                      height: 28,
                    ),
                    const SizedBox(height: 12),

                    // Showtimes Grid
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: format.times.map((timeData) {
                        final time = timeData[0] as String;
                        final isDisabled = timeData[1] as bool;
                        final formatType = timeData.length > 2
                            ? timeData[2] as String
                            : "3d";

                        return GestureDetector(
                          onTap: () {
                            if (!isDisabled) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SelectSeatsPage(
                                    time: time,
                                    cinema: cinema.cinemaName,
                                    format: format.formatName,
                                  ),
                                ),
                              );
                            }
                          },
                          child: Container(
                            width: 120,
                            height: 40,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: isDisabled
                                  ? AppColours.grey
                                  : AppColours.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Showtime Text
                                Text(
                                  time,
                                  style: TextStyle(
                                    color: isDisabled
                                        ? AppColours.darkGrey
                                        : AppColours.deepIndigo,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    fontFamily: 'SofiaPro',
                                  ),
                                ),
                                // SVG Icon (2D / 3D / 3D_1)
                                SvgPicture.asset(
                                  "assets/images/$formatType.svg",
                                  height: 7.1,
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// Filter Sheet widget
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

/// Widget for filter option boxes
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
