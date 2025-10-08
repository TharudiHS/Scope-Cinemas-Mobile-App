import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scope_cinemas/components/bottom_bar.dart';
import 'package:scope_cinemas/components/app_bar.dart';
import 'package:scope_cinemas/components/button.dart';
import 'package:scope_cinemas/data/models/seat_layout_model.dart';
import 'package:scope_cinemas/screens/terms_conditions_popup.dart';
import 'package:scope_cinemas/utils/app_colours.dart';
import 'package:scope_cinemas/utils/text_styles.dart';

class SeatPlanPage extends StatefulWidget {
  const SeatPlanPage({super.key});

  @override
  State<SeatPlanPage> createState() => _SeatPlanPageState();
}

class _SeatPlanPageState extends State<SeatPlanPage> {
  int selectedTimeIndex = 0;
  List<String> timeSlots = ['10:30 AM', '02:30 PM', '06:30 PM'];

  late List<List<List<String>>> directorLoungeSeats;
  late List<List<List<String>>> standardSeats;

  bool showTicketPopup = false;
  int adultCount = 1;
  int childCount = 1;

  @override
  void initState() {
    super.initState();
    directorLoungeSeats = SeatLayoutModel.getDirectorLoungeSeats();
    standardSeats = SeatLayoutModel.getStandardSeats();
  }

  void toggleSeat(List<List<String>> block, int row, int col) {
    setState(() {
      if (block[row][col] == 'available') {
        block[row][col] = 'selected';
      } else if (block[row][col] == 'selected') {
        block[row][col] = 'available';
      }

      // Check if any seat is selected to show popup
      bool anySelected =
          directorLoungeSeats
              .expand((b) => b)
              .expand((r) => r)
              .contains('selected') ||
          standardSeats.expand((b) => b).expand((r) => r).contains('selected');

      showTicketPopup = anySelected;
    });
  }

  Widget buildTimeSlots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: timeSlots.asMap().entries.map((entry) {
        int index = entry.key;
        String time = entry.value;
        bool selected = index == selectedTimeIndex;

        return GestureDetector(
          onTap: () => setState(() => selectedTimeIndex = index),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 18),
            decoration: BoxDecoration(
              color: selected ? AppColours.crimsonRed : Colors.transparent,
            ),
            child: Text(
              time,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget buildScreenHeader() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 40,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 10),
          child: CustomPaint(painter: ScreenArcPainter()),
        ),
        const Text(
          "SCREEN",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Positioned(
          right: 5,
          child: GestureDetector(
            onTap: () {},
            child: SvgPicture.asset(
              "assets/images/zoom_in.svg",
              width: 22,
              height: 22,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildSeatBlockGrid(
    List<List<String>> blockRows,
    int blockIndex,
    String sectionType,
  ) {
    const double seatWidth = 16.37;
    const double seatHorizontalMargin = 3;
    final double seatTotalWidth = seatWidth + (seatHorizontalMargin * 2);

    final int maxCols = blockRows
        .map((r) => r.length)
        .fold(0, (prev, cur) => max(prev, cur));
    final double blockWidth = maxCols * seatTotalWidth;

    return SizedBox(
      width: blockWidth,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(blockRows.length, (rowIndex) {
          final row = blockRows[rowIndex];

          MainAxisAlignment rowAlignment = MainAxisAlignment.center;
          final bool isDirector = sectionType == 'director';
          final bool isStandard = sectionType == 'standard';
          final int lastRowIndex = blockRows.length - 1;

          if (blockIndex == 0) {
            if (isDirector && rowIndex <= 2) {
              rowAlignment = MainAxisAlignment.end;
            } else if (isStandard &&
                (rowIndex <= 2 || rowIndex == lastRowIndex)) {
              rowAlignment = MainAxisAlignment.end;
            }
          } else if (blockIndex == 2) {
            if (isDirector && rowIndex <= 2) {
              rowAlignment = MainAxisAlignment.start;
            } else if (isStandard &&
                (rowIndex <= 2 || rowIndex == lastRowIndex)) {
              rowAlignment = MainAxisAlignment.start;
            }
          }

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: rowAlignment,
              children: List.generate(row.length, (seatIndex) {
                final status = row[seatIndex];

                Color bgColor;
                Color borderColor = Colors.white;

                switch (status) {
                  case 'occupied':
                    bgColor = AppColours.crimsonRed;
                    break;
                  case 'selected':
                    bgColor = AppColours.brightGreen;
                    break;
                  case 'unavailable':
                    bgColor = AppColours.graniteGray;
                    break;
                  default:
                    bgColor = Colors.transparent;
                }

                return GestureDetector(
                  onTap: status == 'occupied' || status == 'unavailable'
                      ? null
                      : () => toggleSeat(blockRows, rowIndex, seatIndex),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 3),
                    width: seatWidth,
                    height: 16.37,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: bgColor,
                      border: Border.all(color: borderColor, width: 1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'L1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                );
              }),
            ),
          );
        }),
      ),
    );
  }

  Widget buildSeatSection(
    List<List<List<String>>> seatBlocks, {
    required String sectionType,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: seatBlocks.asMap().entries.map((entry) {
        int index = entry.key;
        double spacing = index == 1 ? 12 : 5;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: spacing),
          child: buildSeatBlockGrid(entry.value, index, sectionType),
        );
      }).toList(),
    );
  }

  Widget buildSeatLegend() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              legendItem(AppColours.brightGreen, 'Selected'),
              const SizedBox(width: 75),
              legendItem(Colors.transparent, 'Available', border: true),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              legendItem(AppColours.crimsonRed, 'Occupied'),
              const SizedBox(width: 75),
              legendItem(AppColours.graniteGray, 'Unavailable'),
            ],
          ),
        ],
      ),
    );
  }

  Widget legendItem(Color color, String label, {bool border = false}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4),
            border: border ? Border.all(color: Colors.white, width: 1) : null,
          ),
        ),
        const SizedBox(width: 5),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 13)),
      ],
    );
  }

  Widget _buildMovieHeader(BuildContext context) {
    return Container(
      color: AppColours.deepIndigo,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                icon: Image.asset(
                  "assets/images/arrow_back.png",
                  width: 30,
                  height: 30,
                  color: Colors.white,
                ),
                onPressed: () => Navigator.pop(context),
              ),
              ClipRRect(
                child: Image.asset(
                  "assets/images/superman1.jpeg",
                  height: 40,
                  width: 30,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 8),
              Text("SUPERMAN", style: TextStyles.size16SofiaProwhite),
            ],
          ),
        ],
      ),
    );
  }

  Widget ticketTypeColumn(
    String title,
    String price,
    int count,
    Function(int) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: Colors.black,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          price,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            GestureDetector(
              onTap: () {
                if (count > 0) onChanged(count - 1);
              },
              child: const Icon(
                Icons.remove_circle_outline,
                color: Colors.black,
                size: 24,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              '$count',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 12),
            GestureDetector(
              onTap: () => onChanged(count + 1),
              child: const Icon(
                Icons.add_circle_outline,
                color: Colors.black,
                size: 24,
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.darkBlue,
      appBar: const CustomAppBar(),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 1),
      body: Stack(
        children: [
          Column(
            children: [
              _buildMovieHeader(context),
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      buildTimeSlots(),
                      const SizedBox(height: 20),
                      Container(
                        height: 1,
                        color: AppColours.royalIndigo.withOpacity(0.7),
                      ),
                      const SizedBox(height: 20),
                      buildScreenHeader(),
                      const SizedBox(height: 20),
                      Text(
                        "Director's Lounge | LKR 800.00",
                        style: TextStyles.size14SofiaProwhite,
                      ),
                      const SizedBox(height: 25),
                      buildSeatSection(
                        directorLoungeSeats,
                        sectionType: 'director',
                      ),
                      const SizedBox(height: 30),
                      Text(
                        "Standard | LKR 1000.00",
                        style: TextStyles.size14SofiaProwhite,
                      ),
                      const SizedBox(height: 25),
                      buildSeatSection(standardSeats, sectionType: 'standard'),
                      const SizedBox(height: 30),
                      buildSeatLegend(),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Popup Message
          if (showTicketPopup)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 20,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Gold line
                    Center(
                      child: Container(
                        height: 3,
                        width: 148,
                        decoration: BoxDecoration(
                          color: AppColours.goldenYellow,
                          borderRadius: BorderRadius.circular(2),
                        ),
                        margin: const EdgeInsets.only(bottom: 16),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Title and Edit Tickets
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "TICKETS TYPE",
                          style: TextStyles.size20SofiaPro,
                        ),
                        GestureDetector(
                          onTap: () => setState(() => showTicketPopup = false),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.open_in_new,
                                size: 16,
                                color: AppColours.goldenYellow,
                              ),
                              const SizedBox(width: 6),
                              const Text(
                                "Edit Tickets",
                                style: TextStyles.size16SofiaProgoldenYellow,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),
                    const Divider(height: 1, color: AppColours.royalIndigo),
                    const SizedBox(height: 12),

                    // Adult and Child Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // Adult Column
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "ADULT",
                                style: TextStyles.size20SofiaPro,
                              ),
                              const SizedBox(height: 16),
                              const Text(
                                "LKR 2,375.00",
                                style: TextStyles.size14SofiaProdarkBlue,
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      if (adultCount > 0) {
                                        setState(() => adultCount--);
                                      }
                                    },
                                    child: SvgPicture.asset(
                                      "assets/images/-.svg",
                                      height: 35,
                                      width: 35,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: Text(
                                      "$adultCount",
                                      style: TextStyles.size32SofiaPro,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => setState(() => adultCount++),
                                    child: SvgPicture.asset(
                                      "assets/images/+.svg",
                                      height: 35,
                                      width: 35,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        Container(width: 1, height: 105, color: Colors.black26),

                        // Child Column
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                "CHILD",
                                style: TextStyles.size20SofiaPro,
                              ),
                              const Text(
                                "(AGES 3 - 12)",
                                style: TextStyles.size10SofiaProcrimsonRed,
                              ),
                              const SizedBox(height: 4),
                              const Text(
                                "LKR 1,575.00",
                                style: TextStyles.size14SofiaProdarkBlue,
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      if (childCount > 0) {
                                        setState(() => childCount--);
                                      }
                                    },
                                    child: SvgPicture.asset(
                                      "assets/images/-.svg",
                                      height: 35,
                                      width: 35,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                    ),
                                    child: Text(
                                      "$childCount",
                                      style: TextStyles.size32SofiaPro,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () => setState(() => childCount++),
                                    child: SvgPicture.asset(
                                      "assets/images/+.svg",
                                      height: 35,
                                      width: 35,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 16),
                    CustomButton(
                      text: "PROCEED - LKR 5,325",
                      onPressed: () {
                        TermsConditionsPopup.show(context);
                      },
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

// SCREEN ARC
class ScreenArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final goldPaint = Paint()
      ..color = AppColours.goldenYellow
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final bluePaint = Paint()
      ..color = AppColours.deepIndigo
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    final goldPath = Path();
    goldPath.moveTo(0, size.height);
    goldPath.quadraticBezierTo(
      size.width / 2,
      -size.height / 2,
      size.width,
      size.height,
    );

    final bluePath = Path();
    bluePath.moveTo(0, size.height + 4);
    bluePath.quadraticBezierTo(
      size.width / 2,
      -size.height / 2 + 4,
      size.width,
      size.height + 4,
    );

    canvas.drawPath(bluePath, bluePaint);
    canvas.drawPath(goldPath, goldPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
