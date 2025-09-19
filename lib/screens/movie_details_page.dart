import 'package:flutter/material.dart';
import 'package:scope_cinemas/components/app_bar.dart';
import 'package:scope_cinemas/components/bottom_bar.dart';
import 'package:scope_cinemas/components/main_button.dart';
import 'package:scope_cinemas/utils/app_colours.dart';
import 'package:scope_cinemas/utils/text_styles.dart';

class MovieDetailsPage extends StatelessWidget {
  const MovieDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.darkBlue,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Poster
            Center(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      "assets/images/superman.png",
                      height: 280,
                      width: 190,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.85),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.play_arrow,
                      size: 40,
                      color: AppColours.darkBlue,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Title
            Center(
              child: Text("SUPERMAN", style: TextStyles.size36SofiaProwhite),
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
            const SizedBox(height: 16),

            // Release Date
            Center(
              child: Text(
                "Release Date: February 28",
                style: TextStyles.size14SofiaProgoldenYellow,
              ),
            ),
            const SizedBox(height: 24),

            // Synopsis
            Text("SYNOPSIS", style: TextStyles.size20SofiaProwhitemedium),
            const SizedBox(height: 8),
            Text(
              "Follows the titular superhero as he reconciles his heritage with his human upbringing. "
              "He is the embodiment of truth, justice and the human way in a world that views this as old-fashioned.",
              style: TextStyles.size16SofiaProwhitelight,
            ),
            const SizedBox(height: 24),

            // Director
            Text("DIRECTOR", style: TextStyles.size20SofiaProwhitemedium),
            const SizedBox(height: 6),
            Text("James Gunn", style: TextStyles.size16SofiaProwhitelight),
            const SizedBox(height: 20),

            // Writers
            Text("WRITERS", style: TextStyles.size20SofiaProwhitemedium),
            const SizedBox(height: 6),
            Text(
              "Jerry Siegel, Joe Shuster, James Gunn",
              style: TextStyles.size16SofiaProwhitelight,
            ),
            const SizedBox(height: 20),

            // Cast
            Text("CAST", style: TextStyles.size20SofiaProwhitemedium),
            const SizedBox(height: 6),
            Text(
              "Nicholas Hoult, Rachel Brosnahan, Nathan Fillion, Alan Tudyk, Isabela Merced",
              style: TextStyles.size16SofiaProwhitelight,
            ),
            const SizedBox(height: 30),

            // Buy Tickets Button
            MainButton(label: "BUY TICKETS", onPressed: () {}),
            const SizedBox(height: 40),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 1),
    );
  }
}
