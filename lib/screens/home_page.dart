import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scope_cinemas/components/app_bar.dart';
import 'package:scope_cinemas/components/bottom_bar.dart';
import 'package:scope_cinemas/utils/app_colours.dart';
import 'package:scope_cinemas/utils/text_styles.dart';
import 'package:scope_cinemas/data/models/movie_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final nowShowing = movies
        .where((m) => m.category == "Now Showing")
        .toList();
    final scopeExclusives = movies
        .where((m) => m.category == "Scope Exclusives")
        .toList();
    final comingSoon = movies
        .where((m) => m.category == "Coming Soon")
        .toList();

    return Scaffold(
      backgroundColor: AppColours.darkBlue,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildBanner(),
            const SizedBox(height: 20),

            buildSectionTitle("NOW SHOWING"),
            buildMovieCarousel(nowShowing),

            buildSectionTitle("SCOPE EXCLUSIVES"),
            buildMovieCarousel(scopeExclusives),

            buildSectionTitle("COMING SOON"),
            buildMovieCarousel(comingSoon),

            buildScopeIMAXSection(context),
            buildOffersSection(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 0),
    );
  }

  //Banner
  Widget buildBanner() {
    return Stack(
      children: [
        Container(
          height: 750,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/mobile-image.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          height: 750,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black.withOpacity(0.6), Colors.transparent],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Positioned(
          left: 25,
          bottom: 60,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("SUPERMAN", style: TextStyles.size60SofiaPro),
              const SizedBox(height: 5),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColours.white,
                      foregroundColor: AppColours.darkBlue,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 10,
                      ),
                      textStyle: TextStyles.size16SofiaPro,
                    ),
                    child: const Text("BUY TICKETS"),
                  ),
                  const SizedBox(width: 12),
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.white),
                      foregroundColor: Colors.white,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 10,
                      ),
                      textStyle: TextStyles.size16SofiaProwhite,
                    ),
                    child: const Text("WATCH TRAILER"),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Row(
                  children: List.generate(
                    5,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      width: 48,
                      height: 1,
                      color: AppColours.goldenYellow,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  //Section Title
  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text(title, style: TextStyles.size24SofiaPro),
              const Text(
                "View All",
                style: TextStyles.size14SofiaProgoldenYellow,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(height: 2, color: AppColours.royalIndigo.withOpacity(0.7)),
        ],
      ),
    );
  }

  // Movie Carousel
  Widget buildMovieCarousel(List<Movie> moviesList) {
    final PageController controller = PageController(viewportFraction: 0.55);

    return SizedBox(
      height: 400,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            controller: controller,
            itemCount: moviesList.length,
            itemBuilder: (context, index) {
              final movie = moviesList[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    // Poster with gradient overlay
                    Stack(
                      children: [
                        Container(
                          height: 300,

                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(movie.imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        // Gradient overlay box
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
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  movie.title,
                                  style: TextStyles.size20SofiaProwhite,
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  movie.subtitle,
                                  style: TextStyles.size10SofiaPro,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Buy Tickets button
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: AppColours.darkBlue,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 10,
                        ),
                      ),
                      child: Text(
                        "BUY TICKETS",
                        style: TextStyles.size16SofiaPro,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),

          // Left Arrow
          Positioned(
            left: 0,
            top: 100,
            child: IconButton(
              icon: SvgPicture.asset(
                "assets/images/arrow-left.svg",
                height: 40,
                width: 40,
                color: Colors.white,
              ),
              onPressed: () {
                controller.previousPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ),

          // Right Arrow
          Positioned(
            right: 0,
            top: 100,
            child: IconButton(
              icon: SvgPicture.asset(
                "assets/images/arrow-right.svg",
                height: 40,
                width: 40,
                color: Colors.white,
              ),
              onPressed: () {
                controller.nextPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  // Offers Section
  Widget buildOffersSection() {
    final PageController controller = PageController(viewportFraction: 0.8);

    return Container(
      color: AppColours.darkBlue,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: const Text(
              "OFFERS & COMPETITIONS",
              style: TextStyles.size24SofiaPro,
            ),
          ),
          const SizedBox(height: 20),

          // Carousel with offers
          SizedBox(
            height: 380,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PageView(
                  controller: controller,
                  children: [
                    // Offer 1
                    buildOfferCardWithButton("assets/images/images1.jpg"),
                    // Offer 2
                    buildOfferCardWithButton("assets/images/images2.jpg"),
                    // Offer 3
                    buildOfferCardWithButton("assets/images/images3.jpg"),
                  ],
                ),

                // Left Arrow
                Positioned(
                  left: 0,
                  child: IconButton(
                    icon: SvgPicture.asset(
                      "assets/images/arrow-left.svg",
                      height: 40,
                      width: 40,
                    ),
                    onPressed: () {
                      controller.previousPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),

                // Right Arrow
                Positioned(
                  right: 0,
                  child: IconButton(
                    icon: SvgPicture.asset(
                      "assets/images/arrow-right.svg",
                      height: 40,
                      width: 40,
                    ),
                    onPressed: () {
                      controller.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Reusable offer card with button
  Widget buildOfferCardWithButton(String assetPath) {
    return Column(
      children: [
        // Image
        Container(
          height: 280,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(assetPath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 10),

        // Explore button
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: AppColours.darkBlue,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          ),
          child: const Text("EXPLORE", style: TextStyles.size16SofiaPro),
        ),
      ],
    );
  }

  // Reusable offer card widget
  Widget buildOfferCard(String assetPath) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(image: AssetImage(assetPath), fit: BoxFit.cover),
      ),
    );
  }

  //experiences section
  Widget buildScopeIMAXSection(BuildContext context) {
    final PageController controller = PageController();

    return Container(
      // Background image
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/experiences-bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title and description
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text("EXPERIENCES", style: TextStyles.size20SofiaPro),
                SizedBox(height: 5),
                Text("SCOPE IMAX", style: TextStyles.size50SofiaPro),
                SizedBox(height: 10),
                Text(
                  "At Scope Cinemas, our IMAX, IMAX 3D experience redefines movie watching. With massive screens and stunning visuals,...",
                  style: TextStyles.size16SofiaPromidnightBlue,
                ),
                SizedBox(height: 25),
              ],
            ),
          ),

          // Know More button
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColours.royalIndigo),
                foregroundColor: Colors.white,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.zero,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 12,
                ),
              ),
              child: const Text(
                "KNOW MORE",
                style: TextStyles.size16SofiaProroyalIndigo,
              ),
            ),
          ),

          const SizedBox(height: 30),

          // Carousel with arrows
          SizedBox(
            height: 140,
            child: Stack(
              alignment: Alignment.center,
              children: [
                PageView(
                  controller: controller,
                  children: [
                    // IMAX (larger card)
                    SizedBox(
                      width: 100,
                      height: 140,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: AppColours.darkBlue,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: AppColours.softLavender,
                            width: 2,
                          ),
                        ),
                        child: Center(
                          child: Image.asset("assets/images/imax.png"),
                        ),
                      ),
                    ),

                    // Smaller cards
                    ...[
                      "assets/images/directors_lounge.png",
                      "assets/images/goldclass.png",
                      "assets/images/dolby_atmos.png",
                      "assets/images/cinema.png",
                    ].map((iconPath) {
                      return SizedBox(
                        width: 120,
                        height: 120,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: AppColours.darkBlue,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: AppColours.softLavender,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Image.asset(iconPath, fit: BoxFit.contain),
                          ),
                        ),
                      );
                    }).toList(),
                  ],
                ),

                // Left Arrow
                Positioned(
                  left: 0,
                  child: IconButton(
                    icon: SvgPicture.asset(
                      "assets/images/arrow-left.svg",
                      height: 40,
                      width: 40,
                    ),
                    onPressed: () {
                      controller.previousPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),

                // Right Arrow
                Positioned(
                  right: 0,
                  child: IconButton(
                    icon: SvgPicture.asset(
                      "assets/images/arrow-right.svg",
                      height: 40,
                      width: 40,
                    ),
                    onPressed: () {
                      controller.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
