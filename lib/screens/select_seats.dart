import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scope_cinemas/components/bottom_bar.dart';
import 'package:scope_cinemas/components/button.dart';
import 'package:scope_cinemas/screens/seatplan_page.dart';
import 'package:scope_cinemas/utils/app_colours.dart';
import 'package:scope_cinemas/utils/text_styles.dart';

class SelectSeatsPage extends StatefulWidget {
  final String time;
  final String cinema;
  final String format;

  const SelectSeatsPage({
    super.key,
    required this.time,
    required this.cinema,
    required this.format,
  });

  @override
  State<SelectSeatsPage> createState() => _SelectSeatsPageState();
}

class _SelectSeatsPageState extends State<SelectSeatsPage> {
  int ticketCount = 1;

  void increaseTickets() {
    setState(() {
      ticketCount++;
    });
  }

  void decreaseTickets() {
    if (ticketCount > 1) {
      setState(() {
        ticketCount--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/bg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Dark overlay
          Container(color: Colors.black.withOpacity(0.8)),

          // White bottom sheet
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.42,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  // Gold line
                  Container(
                    height: 3,
                    width: 148,
                    decoration: BoxDecoration(
                      color: AppColours.goldenYellow,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    margin: const EdgeInsets.only(bottom: 16),
                  ),

                  // Title
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "HOW MANY TICKETS?",
                      style: TextStyles.size20SofiaPro,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Divider
                  const Divider(height: 1, color: AppColours.royalIndigo),

                  const SizedBox(height: 24),

                  // Ticket image (SVG)
                  SvgPicture.asset("assets/images/notickets.svg", height: 80),

                  const SizedBox(height: 15),

                  const Text(
                    "No. Of Tickets",
                    style: TextStyles.size16SofiaPro,
                  ),
                  const SizedBox(height: 12),

                  // Counter Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Minus button (SVG)
                      GestureDetector(
                        onTap: decreaseTickets,
                        child: SvgPicture.asset(
                          "assets/images/-.svg",
                          height: 35,
                          width: 35,
                        ),
                      ),
                      const SizedBox(width: 30),

                      // Ticket count
                      Text("$ticketCount", style: TextStyles.size37SofiaPro),
                      const SizedBox(width: 30),

                      // Plus button (SVG)
                      GestureDetector(
                        onTap: increaseTickets,
                        child: SvgPicture.asset(
                          "assets/images/+.svg",
                          height: 35,
                          width: 35,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // Select Seats button
                  CustomButton(
                    text: "SELECT SEATS",
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SeatPlanPage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 1),
    );
  }
}
