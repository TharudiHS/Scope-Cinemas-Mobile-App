import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scope_cinemas/components/app_bar.dart';
import 'package:scope_cinemas/components/bottom_bar.dart';
import 'package:scope_cinemas/data/models/showtimes_model.dart';
import 'package:scope_cinemas/utils/app_colours.dart';
import 'package:scope_cinemas/utils/text_styles.dart';

class BuyTicketLocationPage extends StatelessWidget {
  const BuyTicketLocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final imaxTimes = [
      {"time": "10:30 AM", "disabled": true, "format": "3d"},
      {"time": "10:30 AM", "disabled": false, "format": "3d"},
      {"time": "10:30 AM", "disabled": false, "format": "2d"},
      {"time": "10:30 AM", "disabled": false, "format": "3d"},
    ];

    final dolbyTimes = [
      {"time": "10:30 AM", "disabled": true, "format": "3d"},
      {"time": "10:30 AM", "disabled": false, "format": "3d"},
    ];

    return Scaffold(
      backgroundColor: AppColours.darkBlue,
      appBar: const CustomAppBar(),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 2),
      body: Column(
        children: [
          _buildHeader(context),
          _buildDateSelector(),
          Divider(color: AppColours.royalIndigo.withOpacity(0.7)),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 10),

                  // SUPERMAN
                  _buildMovieSection(
                    context: context,
                    title: "SUPERMAN",
                    posterPath: "assets/images/superman1.jpeg",
                    formatLogo: "assets/images/imax.png",
                    times: imaxTimes,
                    showPoster: true,
                  ),
                  _buildMovieSection(
                    context: context,
                    title: "",
                    posterPath: "",
                    formatLogo: "assets/images/dolby.png",
                    times: dolbyTimes,
                    showPoster: false,
                  ),

                  Divider(color: AppColours.royalIndigo.withOpacity(0.7)),

                  // CAPTAIN AMERICA
                  _buildMovieSection(
                    context: context,
                    title: "CAPTAIN AMERICA : BRAVE NEW \nWORLD",
                    posterPath: "assets/images/captain_america.jpg",
                    formatLogo: "assets/images/imax.png",
                    times: imaxTimes,
                    showPoster: true,
                  ),
                  _buildMovieSection(
                    context: context,
                    title: "",
                    posterPath: "",
                    formatLogo: "assets/images/dolby.png",
                    times: dolbyTimes,
                    showPoster: false,
                  ),

                  Divider(color: AppColours.royalIndigo.withOpacity(0.7)),

                  // JURASSIC WORLD
                  _buildMovieSection(
                    context: context,
                    title: "JURASSIC WORLD: REBIRTH",
                    posterPath: "assets/images/jurassic_world.jpeg",
                    formatLogo: "assets/images/dolby.png",
                    times: dolbyTimes,
                    showPoster: true,
                  ),

                  const SizedBox(height: 24),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
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
              Navigator.pop(context);
            },
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "SCOPE CINEMAS MULTIPLEX - \nCOLOMBO CITY CENTRE",
                    style: TextStyles.size16SofiaProwhite,
                  ),
                ),
                const SizedBox(width: 10),
                Image.asset(
                  "assets/images/arrow-54.png",
                  height: 13,
                  width: 13,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          const Icon(Icons.tune, color: Colors.white),
        ],
      ),
    );
  }

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

  Widget _buildMovieSection({
    required BuildContext context,
    required String title,
    required String posterPath,
    required String formatLogo,
    required List<Map<String, dynamic>> times,
    required bool showPoster,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        decoration: BoxDecoration(color: AppColours.deepIndigo),
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            if (showPoster && posterPath.isNotEmpty) ...[
              Image.asset(posterPath, height: 120, fit: BoxFit.cover),
              const SizedBox(height: 8),
              Text(title, style: TextStyles.size20SofiaProwhitemedium),
              const SizedBox(height: 8),
            ],
            Image.asset(formatLogo, height: 25),
            const SizedBox(height: 12),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: times.map((t) {
                final disabled = t["disabled"] as bool;
                final time = t["time"] as String;
                final format = t["format"] as String;
                return GestureDetector(
                  onTap: disabled ? null : () {},
                  child: Container(
                    width: 150,
                    height: 40,
                    decoration: BoxDecoration(
                      color: disabled ? AppColours.grey : AppColours.white,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          time,
                          style: TextStyle(
                            color: disabled
                                ? AppColours.darkGrey
                                : AppColours.deepIndigo,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        SvgPicture.asset(
                          "assets/images/$format.svg",
                          height: 8,
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
    );
  }
}
