import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scope_cinemas/components/app_bar.dart';
import 'package:scope_cinemas/components/bottom_bar.dart';
import 'package:scope_cinemas/screens/filter_page.dart';
import 'package:scope_cinemas/screens/movie_details_page.dart';
import 'package:scope_cinemas/utils/app_colours.dart';
import 'package:scope_cinemas/utils/text_styles.dart';

/// Model class for date selector
class ShowDate {
  final String day;
  final String date;
  final String month;
  final bool selected;

  ShowDate(this.day, this.date, this.month, this.selected);
}

/// Model class for cinema format
class CinemaFormat {
  final String formatName;
  final List<List<dynamic>> times;

  CinemaFormat(this.formatName, this.times);
}

/// Model class for cinema
class Cinema {
  final String cinemaName;
  final List<CinemaFormat> formats;

  Cinema(this.cinemaName, this.formats);
}

class ShowtimesPage extends StatelessWidget {
  const ShowtimesPage({super.key});

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
      body: Column(
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
                      Divider(color: AppColours.royalIndigo.withOpacity(0.7)),
                  ],
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
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
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const FilterPage()),
              );
            },
            splashRadius: 22,
            tooltip: 'Filter',
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
                        return Container(
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
