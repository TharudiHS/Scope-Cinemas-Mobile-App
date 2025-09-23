import 'package:flutter/material.dart';
import 'package:scope_cinemas/components/app_bar.dart';
import 'package:scope_cinemas/components/bottom_bar.dart';
import 'package:scope_cinemas/components/main_button.dart';
import 'package:scope_cinemas/screens/movies_page.dart';
import 'package:scope_cinemas/screens/showtimes_page.dart';
import 'package:scope_cinemas/utils/app_colours.dart';
import 'package:scope_cinemas/utils/text_styles.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.darkBlue,
      appBar: const CustomAppBar(),

      body: Column(
        children: [
          Container(
            width: double.infinity,
            color: AppColours.deepIndigo,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
            child: Row(
              children: [
                // Back Button
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
                        builder: (context) => const MoviesPage(),
                      ),
                    );
                  },
                ),

                const Spacer(),

                // Title
                Text("DETAILS", style: TextStyles.size16SofiaProwhite),

                const Spacer(),

                const SizedBox(width: 50),
              ],
            ),
          ),

          // Main content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Poster
                  Center(
                    child: ClipRRect(
                      child: Image.asset(
                        "assets/images/superman.png",
                        height: 280,
                        width: 190,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Title
                  Center(
                    child: Text(
                      "SUPERMAN",
                      style: TextStyles.size36SofiaProwhite,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Genres / duration / format
                  Center(
                    child: Text(
                      "ACTION / SCI-FI , 2 H 30 MIN | IMAX 3D | U/A",
                      textAlign: TextAlign.center,
                      style: TextStyles.size14SofiaProwhite,
                    ),
                  ),

                  const SizedBox(height: 25),
                  Divider(color: AppColours.royalIndigo.withOpacity(0.7)),
                  const SizedBox(height: 25),

                  // Release Date
                  Center(
                    child: Text(
                      "Release Date: February 28",
                      style: TextStyles.size14SofiaProgoldenYellow,
                    ),
                  ),
                  const SizedBox(height: 25),
                  Divider(color: AppColours.royalIndigo.withOpacity(0.7)),
                  const SizedBox(height: 25),

                  // Synopsis
                  Text("SYNOPSIS", style: TextStyles.size20SofiaProwhitemedium),
                  const SizedBox(height: 15),
                  Text(
                    "Follows the titular superhero as he reconciles his heritage with his human upbringing. "
                    "He is the embodiment of truth, justice and the human way in a world that views this as old-fashioned.",
                    style: TextStyles.size16SofiaProwhitelight,
                  ),
                  const SizedBox(height: 25),

                  // Director
                  Text("DIRECTOR", style: TextStyles.size20SofiaProwhitemedium),
                  const SizedBox(height: 15),
                  Text(
                    "James Gunn",
                    style: TextStyles.size16SofiaProwhitelight,
                  ),
                  const SizedBox(height: 25),

                  // Writers
                  Text("WRITERS", style: TextStyles.size20SofiaProwhitemedium),
                  const SizedBox(height: 15),
                  Text(
                    "Jerry Siegel, Joe Shuster, James Gunn",
                    style: TextStyles.size16SofiaProwhitelight,
                  ),
                  const SizedBox(height: 25),

                  // Cast
                  Text("CAST", style: TextStyles.size20SofiaProwhitemedium),
                  const SizedBox(height: 15),
                  Text(
                    "Nicholas Hoult, Rachel Brosnahan, Nathan Fillion, Alan Tudyk, Isabela Merced",
                    style: TextStyles.size16SofiaProwhitelight,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      //  Bottom area
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: MainButton(
              label: "BUY TICKETS",
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShowtimesPage(),
                  ),
                );
              },
            ),
          ),
          const BottomNavBar(selectedIndex: 1),
        ],
      ),
    );
  }
}
