import 'package:flutter/material.dart';
import '../components/app_bar.dart';
import '../utils/app_colours.dart';
import '../utils/text_styles.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // movie data
    final List<Map<String, String>> movies = [
      {
        "title": "AKASA KUSUM (Sinhala Rerelease)",
        "status": "In Theaters Now",
        "image": "assets/images/movies/akasa_kusum.jpg",
      },
      {
        "title": "LILO & STITCH",
        "status": "In Theaters Now",
        "image": "assets/images/movies/lilo_stitch.jpg",
      },
      {
        "title": "FINAL DESTINATION: BLOODLINES",
        "status": "In Theaters Now",
        "image": "assets/images/movies/final_destination.jpg",
      },
      {
        "title": "THE BHOOTNII (Hindi)",
        "status": "In Theaters Now",
        "image": "assets/images/movies/bhootnii.jpg",
      },
      {
        "title": "RANI (SINHALA)",
        "status": "In Theaters Now",
        "image": "assets/images/movies/rani.jpg",
      },
      {
        "title": "MINECRAFT",
        "status": "In Theaters Now",
        "image": "assets/images/movies/minecraft.jpg",
      },
      {
        "title": "EARLY ACCESS: MISSION IMPOSSIBLE: THE FINAL RECKONING",
        "status": "In Theaters Now",
        "image": "assets/images/movies/mission_impossible.jpg",
      },
      {
        "title": "GANGERS (TAMIL)",
        "status": "In Theaters Now",
        "image": "assets/images/movies/gangers.avif",
      },
    ];

    return Scaffold(
      backgroundColor: AppColours.darkBlue,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text("NOW SHOWING", style: TextStyles.size24SofiaPro),
                    const Icon(Icons.keyboard_arrow_down, color: Colors.white),
                  ],
                ),
                const Icon(Icons.tune, color: Colors.white),
              ],
            ),
            const SizedBox(height: 20),

            /// Movies Grid
            Expanded(
              child: GridView.builder(
                itemCount: movies.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.65,
                ),
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// Poster
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12),
                          ),
                          child: Image.asset(
                            movie["image"]!,
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 8),

                        /// Title
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            movie["title"]!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyles.size14SofiaProwhite,
                          ),
                        ),
                        const SizedBox(height: 4),

                        /// Status
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            movie["status"]!,
                            style: TextStyles.size8SofiaProwhite,
                          ),
                        ),
                        const Spacer(),

                        /// Buy Tickets
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColours.darkBlue,
                                foregroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                              ),
                              onPressed: () {},
                              child: const Text("BUY TICKETS"),
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
    );
  }
}
