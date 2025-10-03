import 'package:flutter/material.dart';
import 'package:scope_cinemas/components/app_bar.dart';
import 'package:scope_cinemas/components/bottom_bar.dart';
import 'package:scope_cinemas/components/main_button.dart';
import 'package:scope_cinemas/screens/offers_competitions_page.dart';
import 'package:scope_cinemas/screens/showtimes_page.dart';
import 'package:scope_cinemas/utils/app_colours.dart';
import 'package:scope_cinemas/utils/text_styles.dart';

class OfferDetailsPage extends StatelessWidget {
  final String title;
  final String image;
  final String location;
  final String duration;
  final String description;

  const OfferDetailsPage({
    super.key,
    this.title = "Buy One Ticket To Watch Seven On IMAX & Get One Free",
    this.image = "assets/images/images3.png",
    this.location = "Liberty by Scope Cinemas - Colpetty",
    this.duration = "Oct 25th to Nov 31st",
    this.description =
        "Purchase a ticket for the movie 'Seven' in IMAX format and get one additional ticket absolutely free. "
        "Offer valid at Liberty by Scope Cinemas (Colpetty). Terms and conditions apply.",
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.darkBlue,
      appBar: const CustomAppBar(),

      body: Column(
        children: [
          // Custom top bar
          Container(
            width: double.infinity,
            color: AppColours.deepIndigo,
            padding: const EdgeInsets.symmetric(vertical: 12),
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
                        builder: (context) => const OffersCompetitionsPage(),
                      ),
                    );
                  },
                ),

                const Spacer(),

                // Title
                Text(
                  "BUY ONE TICKET TO WATCH SEVEN ON IMAX & \nGET ONE FREE WITH YOUR HSBC CREDIT \nCARDS AT SCOPE CINEMAS",
                  style: TextStyles.size16SofiaProwhite,
                ),

                const Spacer(),
              ],
            ),
          ),

          // Main content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(36),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Offer Image
                  Center(
                    child: ClipRRect(
                      child: Image.asset(image, width: 180, fit: BoxFit.cover),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Divider(color: AppColours.royalIndigo.withOpacity(0.7)),
                  const SizedBox(height: 20),

                  // Location & Duration
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Valid Location(s):",
                            style: TextStyles.size14SofiaProcrimsonRed,
                          ),
                          const SizedBox(width: 76),
                          Text(
                            "Promo Duration:",
                            style: TextStyles.size14SofiaProcrimsonRed,
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Text(
                              "Liberty by Scope Cinemas \n- Colpetty",
                              style: TextStyles.size14SofiaProwhitemedium,
                            ),
                          ),
                          const SizedBox(width: 50),
                          Expanded(
                            child: Text(
                              "Oct 25th to Nov 31st",
                              style: TextStyles.size14SofiaProwhitemedium,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),
                  Divider(color: AppColours.royalIndigo.withOpacity(0.7)),
                  const SizedBox(height: 20),

                  // About the offer
                  Text(
                    "About the Offer",
                    style: TextStyles.size16SofiaProwhite,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    """1. Enjoy 20% savings with all Cargills Bank credit cards on all Ceylon Theatres movie tickets.
2. The offer is applicable for all Ceylon Theatre locations, screens, and showtimes. 
3. Minimum 2 tickets need to be bought in one transaction. No transaction limit.
4. It is an exclusive offer for all credit cards issued with Cargills Bank. Offer valid till 31st August 2024. 
5. This offer is valid only on movie tickets bought on Scope Cinemas website, mobile site, and mobile apps""",
                    style: TextStyles.size14SofiaProwhite,
                  ),

                  const SizedBox(height: 30),

                  // How to avail the offer
                  Text(
                    "How To Avail The Offer",
                    style: TextStyles.size16SofiaProwhite,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    """1. Go through the regular ticketing flow, select the movie of your choice showing at Ceylon Theatres.
2. Proceed to payments page.
3. Confirm your details by providing your email id & mobile number as this information will be used for confirming your transaction. 
4. To avail offer, click Avail Offers & Discounts. Click on the tab - Credit/Debit.
5. Choose 'Ceylon Theatres - Cargills Bank Credit Card Offer' 
6. Enter your 16 digit card number in the box and click on 'Apply'. 
7. Congratulations! You would have successfully availed the offer. 
8. Click on Proceed to Pay and complete your payment.""",
                    style: TextStyles.size14SofiaProwhite,
                  ),

                  const SizedBox(height: 30),

                  // Terms & Conditions
                  Text(
                    "Terms & Conditions",
                    style: TextStyles.size16SofiaProwhite,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    """1. Go through the regular ticketing flow, select the movie of your choice showing at Ceylon Theatres. 
2. Proceed to payments page.
3. Confirm your details by providing your email id & mobile number as this information will be used for confirming your transaction. 
4. To avail offer, click Avail Offers & Discounts. Click on the tab - Credit/Debit. 
5. Choose 'Ceylon Theatres - Cargills Bank Credit Card Offer'
6. Enter your 16 digit card number in the box and click on 'Apply'. 
7. Congratulations! You would have successfully availed the offer. 
8. Click on Proceed to Pay and complete your payment. \n\nWant to get a special offer on your movie tickets? Purchase now!""",
                    style: TextStyles.size14SofiaProwhite,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // Bottom Area
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
