import 'package:flutter/material.dart';
import 'package:scope_cinemas/components/app_bar.dart';
import 'package:scope_cinemas/components/bottom_bar.dart';
import 'package:scope_cinemas/screens/menu_page.dart';
import 'package:scope_cinemas/utils/app_colours.dart';
import 'package:scope_cinemas/utils/text_styles.dart';

class BookingHistoryPage extends StatelessWidget {
  const BookingHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.darkBlue,
      appBar: const CustomAppBar(),

      body: Column(
        children: [
          // deep indigo header row
          Container(
            width: double.infinity,
            color: AppColours.deepIndigo,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
            child: Row(
              children: [
                // Back button
                IconButton(
                  icon: Image.asset(
                    "assets/images/arrow_back.png",
                    width: 30,
                    height: 30,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                const Spacer(),
                const Text(
                  "BOOKING HISTORY",
                  style: TextStyles.size16SofiaProwhite,
                ),
                const Spacer(),
                const SizedBox(width: 50),
              ],
            ),
          ),

          // page content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // White box content
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.white),
                    padding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 16,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Movie Poster
                        ClipRRect(
                          child: Image.asset(
                            "assets/images/superman.png",
                            width: 80,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Movie Title
                        const Text(
                          "SUPERMAN",
                          style: TextStyles.size30SofiaPro,
                        ),
                        const SizedBox(height: 6),

                        // Cinema details
                        const Text(
                          "SCOPE CINEMAS - HAVELOCK CITY MALL , \nFRIDAY, 10 JUNE, 10:30 AM, GOLD CLASS 2D : L1, L2, L3",

                          textAlign: TextAlign.center,
                          style: TextStyles.size12SofiaProdarkBlue,
                        ),
                        const SizedBox(height: 4),

                        // Tickets info
                        const Text(
                          "ADULT : 01 , CHILD : 02",
                          style: TextStyles.size12SofiaProdarkBlue,
                        ),
                        const SizedBox(height: 18),

                        // QR code
                        Image.asset(
                          "assets/images/qr.png",
                          width: 160,
                          height: 160,
                        ),
                        const SizedBox(height: 12),

                        // Reference number
                        const Text(
                          "Reference Number",
                          style: TextStyles.size17SofiaPromidnightBlue,
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          "262617842P24302",
                          style: TextStyles.size17SofiaPromidnightBlue,
                        ),

                        const SizedBox(height: 20),
                        Divider(color: AppColours.softLavender, thickness: 1),
                        const SizedBox(height: 12),

                        // Tickets section
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Tickets",
                            style: TextStyles.size20SofiaPromidnightBlue,
                          ),
                        ),
                        const SizedBox(height: 12),

                        _buildTicketRow("Adult Ticket (x1)", "LKR", "1,175.00"),
                        _buildTicketRow("Child Ticket (x2)", "LKR", "2,150.00"),
                        _buildTicketRow("VAT Included", "LKR", "472.88"),
                        _buildTicketRow("Paid Amount", "LKR", "0.00"),

                        const SizedBox(height: 20),

                        // Snacks section
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            "Snacks",
                            style: TextStyles.size20SofiaPromidnightBlue,
                          ),
                        ),
                        const SizedBox(height: 12),

                        _buildTicketRow(
                          "Panko Prawns Burger (x1)",
                          "LKR",
                          "1,900.00",
                        ),
                        _buildTicketRow("Cheese Melt (x1)", "LKR", "1,450.00"),

                        const SizedBox(height: 15),
                        Divider(color: AppColours.softLavender, thickness: 1),
                        const SizedBox(height: 20),
                        // Subtotal + total
                        _buildTicketRow("Sub Total", "LKR", "7,147.88"),
                        const SizedBox(height: 20),
                        Row(
                          children: const [
                            Expanded(
                              child: Text(
                                "Total",
                                style:
                                    TextStyles.size20SofiaPromidnightBluebold,
                              ),
                            ),
                            Text(
                              "LKR",
                              style: TextStyles.size20SofiaPromidnightBluebold,
                            ),
                            SizedBox(width: 6),
                            Text(
                              "7,147.88",
                              style: TextStyles.size20SofiaPromidnightBluebold,
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // date and time row
                        const Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "2022-07-23   06:55 PM",
                            style: TextStyles.size8SofiaPro,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 20),

                  // Download e-ticket button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColours.royalIndigo,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MenuPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "DOWNLOAD E-TICKET",
                        style: TextStyles.size16SofiaProwhite,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: const BottomNavBar(selectedIndex: 4),
    );
  }

  //  tickets & snacks
  static Widget _buildTicketRow(String label, String currency, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Expanded(
            child: Text(label, style: TextStyles.size14SofiaPromidnightBlue),
          ),
          Text(currency, style: TextStyles.size14SofiaPromidnightBlue),
          const SizedBox(width: 4),
          Text(price, style: TextStyles.size14SofiaPromidnightBlue),
        ],
      ),
    );
  }
}
