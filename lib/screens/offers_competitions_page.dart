import 'package:flutter/material.dart';
import 'package:scope_cinemas/components/app_bar.dart';
import 'package:scope_cinemas/components/bottom_bar.dart';
import 'package:scope_cinemas/screens/offer_details_page.dart';
import 'package:scope_cinemas/utils/app_colours.dart';
import 'package:scope_cinemas/utils/text_styles.dart';

class OffersCompetitionsPage extends StatelessWidget {
  const OffersCompetitionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.darkBlue,
      appBar: const CustomAppBar(),

      body: Column(
        children: [
          // header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "OFFERS & COMPETITIONS",
                  style: TextStyles.size24SofiaPro,
                ),
                const SizedBox(height: 10),
                Container(
                  height: 1,
                  color: AppColours.royalIndigo.withOpacity(0.7),
                ),
              ],
            ),
          ),

          // page content
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 30,
                crossAxisSpacing: 18,
                childAspectRatio: 0.40,
              ),
              itemCount: _offers.length,
              itemBuilder: (context, index) {
                final offer = _offers[index];
                return _buildOfferItem(
                  context,
                  offer["image"]!,
                  offer["title"]!,
                );
              },
            ),
          ),
        ],
      ),

      bottomNavigationBar: const BottomNavBar(selectedIndex: 4),
    );
  }

  //card + button
  Widget _buildOfferItem(BuildContext context, String image, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Deep Indigo Card
        Container(
          height: 380,
          decoration: BoxDecoration(color: AppColours.deepIndigo),
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Image
              ClipRRect(
                child: Image.asset(
                  image,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 22),

              // Description
              Text(
                title,
                style: TextStyles.size16SofiaProwhite,
                textAlign: TextAlign.center,
                maxLines: 6,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),

        const SizedBox(height: 10),

        // Button
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const OfferDetailsPage()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: AppColours.darkBlue,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.zero,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          ),
          child: const Text("EXPLORE MORE", style: TextStyles.size16SofiaPro),
        ),
      ],
    );
  }
}

// offers list
final List<Map<String, String>> _offers = [
  {
    "image": "assets/images/images3.png",
    "title":
        "Buy One Ticket To Watch Seven On Imax & Get One Free With Your Hsbc Credit Cards At Scope Cinemas",
  },
  {
    "image": "assets/images/images2.png",
    "title": "Enjoy 20% Off On Food & Drinks With Nation Trust Bank",
  },
  {
    "image": "assets/images/images1.png",
    "title":
        "Buy 2 Jumbo Popcorn & Win A Chance To Get One In A Movie Themed Popcorn Bucket",
  },
  {
    "image": "assets/images/images4.png",
    "title": "One Unforgettable Christmas - Christmas In A Box One",
  },
  {
    "image": "assets/images/images3.png",
    "title":
        "Buy One Ticket To Watch Seven On Imax & Get One Free With Your Hsbc Credit Cards At Scope Cinemas",
  },
  {
    "image": "assets/images/images2.png",
    "title": "Enjoy 20% Off On Food & Drinks With Nation Trust Bank",
  },
  {
    "image": "assets/images/images1.png",
    "title":
        "Buy 2 Jumbo Popcorn & Win A Chance To Get One In A Movie Themed Popcorn Bucket",
  },
  {
    "image": "assets/images/images4.png",
    "title": "One Unforgettable Christmas - Christmas In A Box One",
  },
];
