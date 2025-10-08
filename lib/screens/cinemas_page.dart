import 'package:flutter/material.dart';
import 'package:scope_cinemas/components/app_bar.dart';
import 'package:scope_cinemas/components/bottom_bar.dart';
import 'package:scope_cinemas/screens/cinema_details_page.dart';
import 'package:scope_cinemas/utils/app_colours.dart';
import 'package:scope_cinemas/utils/text_styles.dart';

class CinemasPage extends StatelessWidget {
  const CinemasPage({super.key});

  final Map<String, String> formatIcons = const {
    "Dolby 2D": "assets/images/dolby2d.png",
    "Dolby 3D": "assets/images/dolby3d.png",
    "IMAX 2D": "assets/images/imax2d.png",
    "IMAX 3D": "assets/images/imax3d.png",
  };

  final List<Map<String, dynamic>> cinemas = const [
    {
      "name": "SCOPE CINEMAS MULTIPLEX - COLOMBO CITY CENTRE",
      "image": "assets/images/cinema1.png",
      "formats": ["Dolby 2D", "Dolby 3D", "7.1", "5.1"],
    },
    {
      "name": "LIBERTY BY SCOPE CINEMAS - COLPETTY",
      "image": "assets/images/cinema2.png",
      "formats": ["Dolby 2D", "Dolby 3D", "7.1", "5.1"],
    },
    {
      "name": "SCOPE CINEMAS - HAVELOCK CITY MALL",
      "image": "assets/images/cinema3.png",
      "formats": ["IMAX 3D", "IMAX 2D", "Dolby 2D", "Dolby 3D", "7.1", "5.1"],
    },
    {
      "name": "LIBERTY BY SCOPE CINEMAS - KIRIBATHGODA",
      "image": "assets/images/cinema4.png",
      "formats": ["Dolby 2D", "Dolby 3D", "7.1", "5.1"],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.darkBlue,
      appBar: const CustomAppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        children: [
          const Text("CINEMAS", style: TextStyles.size24SofiaPro),
          const SizedBox(height: 10),

          // Divider line
          Container(height: 1, color: AppColours.royalIndigo.withOpacity(0.7)),
          const SizedBox(height: 25),

          ...cinemas.map((cinema) => buildCinemaCard(context, cinema)).toList(),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 2),
    );
  }

  Widget buildCinemaCard(BuildContext context, Map<String, dynamic> cinema) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cinema Image with overlays
          ClipRRect(
            child: Stack(
              alignment: Alignment.bottomLeft,
              children: [
                // Image
                Image.asset(
                  cinema["image"],
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),

                // Gradient overlay
                Container(
                  height: 250,
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
                ),

                // Text + Formats + Explore More
                Positioned(
                  bottom: 10,
                  left: 12,
                  right: 12,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Cinema Name
                      Text(
                        cinema["name"],
                        style: TextStyles.size14SofiaProwhitebold,
                      ),
                      const SizedBox(height: 4),

                      // Formats row
                      Wrap(
                        spacing: 6,
                        runSpacing: 4,
                        children: cinema["formats"].map<Widget>((format) {
                          final iconPath = formatIcons[format];
                          if (iconPath != null) {
                            return Image.asset(
                              iconPath,
                              height: 14,
                              fit: BoxFit.contain,
                            );
                          } else {
                            return Text(
                              format,
                              style: TextStyles.size14SofiaProwhitebold,
                            );
                          }
                        }).toList(),
                      ),
                      const SizedBox(height: 2),

                      // Explore more
                      Text(
                        "EXPLORE MORE",
                        style: TextStyles.size8SofiaProcrimsonRed,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),

          // Get Directions Button
          Center(
            child: ElevatedButton(
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
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CinemaDetailsPage(),
                  ),
                );
              },
              child: const Text(
                "GET DIRECTIONS",
                style: TextStyles.size16SofiaPro,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
