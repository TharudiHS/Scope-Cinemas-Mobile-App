import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scope_cinemas/components/app_bar.dart';
import 'package:scope_cinemas/components/bottom_bar.dart';
import 'package:scope_cinemas/components/main_button.dart';
import 'package:scope_cinemas/screens/buy_ticket_location_page.dart';
import 'package:scope_cinemas/screens/cinemas_page.dart';
import 'package:scope_cinemas/utils/app_colours.dart';
import 'package:scope_cinemas/utils/text_styles.dart';

class CinemaDetailsPage extends StatefulWidget {
  const CinemaDetailsPage({super.key});

  @override
  State<CinemaDetailsPage> createState() => _CinemaDetailsPageState();
}

class _CinemaDetailsPageState extends State<CinemaDetailsPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> images = ["assets/images/scopecinema.jpeg"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.darkBlue,
      appBar: const CustomAppBar(),

      body: Column(
        children: [
          // Fixed Header
          Container(
            width: double.infinity,
            color: AppColours.deepIndigo,
            padding: const EdgeInsets.symmetric(vertical: 12),
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
                        builder: (context) => const CinemasPage(),
                      ),
                    );
                  },
                ),
                const Expanded(
                  child: Text(
                    "SCOPE CINEMAS MULTIPLEX - COLOMBO CITY CENTRE",
                    style: TextStyles.size16SofiaProwhite,
                  ),
                ),
                const SizedBox(width: 20),
              ],
            ),
          ),

          //  Content
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),

                    // Image Carousel
                    SizedBox(
                      height: 190,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          PageView.builder(
                            controller: _pageController,
                            itemCount: images.length,
                            onPageChanged: (index) {
                              setState(() {
                                _currentPage = index;
                              });
                            },
                            itemBuilder: (context, index) {
                              return ClipRRect(
                                child: Image.asset(
                                  images[index],
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              );
                            },
                          ),
                          // Left arrow
                          if (images.length > 1)
                            Positioned(
                              top: 80,
                              child: GestureDetector(
                                onTap: () {
                                  if (_currentPage > 0) {
                                    _pageController.previousPage(
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                },
                                child: SvgPicture.asset(
                                  "assets/images/arrow-left.svg",
                                  width: 35,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          // Right arrow
                          if (images.length > 1)
                            Positioned(
                              right: 0,
                              top: 80,
                              child: GestureDetector(
                                onTap: () {
                                  if (_currentPage < images.length - 1) {
                                    _pageController.nextPage(
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                },
                                child: SvgPicture.asset(
                                  "assets/images/arrow-right.svg",

                                  width: 35,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),
                    Divider(color: AppColours.royalIndigo.withOpacity(0.7)),
                    const SizedBox(height: 20),

                    // Location
                    Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Location:",
                            style: TextStyles.size20SofiaProwhitelight,
                          ),
                          const SizedBox(height: 8),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              "3rd floor, Colombo City Centre, 137 Sir James Peiris Mawatha, Colombo 02.",
                              textAlign: TextAlign.center,
                              style: TextStyles.size16SofiaProcrimsonred
                                  .copyWith(
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColours.crimsonRed,
                                  ),
                            ),
                          ),

                          const SizedBox(height: 20),
                          Divider(
                            color: AppColours.royalIndigo.withOpacity(0.7),
                          ),
                          const SizedBox(height: 20),

                          // Hotline
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "HOTLINE ",
                                style: TextStyles.size16SofiaProwhitelight,
                              ),
                              const SizedBox(width: 6),
                              Icon(
                                Icons.phone,
                                color: AppColours.crimsonRed,
                                size: 18,
                              ),
                              const SizedBox(width: 6),
                              GestureDetector(
                                onTap: () {},
                                child: Text(
                                  "0112083064",
                                  style: TextStyles.size20SofiaProcrimsonRed
                                      .copyWith(
                                        decoration: TextDecoration.underline,
                                        decorationColor: AppColours.crimsonRed,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),
                    Divider(color: AppColours.royalIndigo.withOpacity(0.7)),
                    const SizedBox(height: 20),

                    // Description
                    Text(
                      "Scope Cinemas Multiplex, located on the 3rd floor of Colombo City Centre at 137 Sir James Peiris Mawatha, Colombo 02, "
                      "is a premier destination for movie enthusiasts seeking a world-class cinematic experience. "
                      "This state-of-the-art multiplex spans 16,000 square feet and features six screens equipped with "
                      "4K projection technology and Dolby Atmos surround sound systems, ensuring crystal-clear visuals "
                      "and immersive audio. With a total seating capacity of approximately 700 seats, the cinema offers "
                      "both standard and Gold Class options. The Gold Class provides luxurious recliner seating and "
                      "in-cinema dining services, allowing patrons to enjoy gourmet food and beverages delivered directly "
                      "to their seats. Since its opening, Scope Cinemas has set a new benchmark in Sri Lanka's entertainment "
                      "landscape, combining cutting-edge technology with exceptional comfort to deliver an unparalleled "
                      "movie-going experience.",
                      style: TextStyles.size16SofiaProwhitelight,
                    ),

                    const SizedBox(height: 20),
                    Divider(color: AppColours.royalIndigo.withOpacity(0.7)),
                    const SizedBox(height: 20),

                    // Key Features
                    Text(
                      "KEY FEATURES OF\nSCOPE CINEMAS MULTIPLEX AT \nCOLOMBO CITY CENTRE:",
                      style: TextStyles.size20SofiaProwhitemedium,
                    ),
                    const SizedBox(height: 12),
                    _buildFeature(
                      "Seating Capacity:",
                      "\n\nApproximately 700 seats across six screens, including standard and Gold Class options.",
                    ),
                    _buildFeature(
                      "Gold Class Cinema:",
                      "\n\nLuxurious recliner seating for enhanced comfort. In-cinema dining with gourmet food and beverage options delivered to your seat.",
                    ),
                    _buildFeature(
                      "Technologies:",
                      "\n\n4K projection technology for high-definition visuals.\nDolby Atmos surround sound systems for immersive audio experiences.",
                    ),
                    _buildFeature(
                      "Additional Amenities:",
                      "\n\nA lounge area offering a selection of cocktails, mocktails, wines, and other beverages. \nAccess to a variety of snacks and refreshments, including popcorn, chicken strips, hot dogs, hot coffee, and chilled soft drinks",
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      //  Bottom Navigation + Button
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
                    builder: (context) => const BuyTicketLocationPage(),
                  ),
                );
              },
            ),
          ),
          const BottomNavBar(selectedIndex: 2),
        ],
      ),
    );
  }

  Widget _buildFeature(String title, String desc) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("• ", style: TextStyle(color: Colors.white, fontSize: 16)),
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "$title ",
                    style: TextStyles.size16SofiaProwhitelight,
                  ),
                  TextSpan(
                    text: desc,
                    style: TextStyles.size16SofiaProwhitelight,
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
