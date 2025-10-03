// lib/screens/seatplan_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scope_cinemas/components/bottom_bar.dart';
import 'package:scope_cinemas/components/app_bar.dart';
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

  /// DIRECTOR’S LOUNGE layout (3 blocks)
  final directorLoungeSeats = [
    // Left block
    [
      ["available", "available", "available"],
      ["available", "available", "available"],
      ["available", "available", "available", "available"],
      ["available", "available", "available", "available"],
    ],

    // Middle block
    [
      [
        "available",
        "available",
        "available",
        "available",
        "available",
        "available",
      ],
      [
        "available",
        "occupied",
        "occupied",
        "occupied",
        "available",
        "available",
      ],
      [
        "available",
        "available",
        "available",
        "available",
        "available",
        "available",
      ],
      [
        "available",
        "available",
        "available",
        "available",
        "available",
        "available",
      ],
    ],

    // Right block
    [
      ["available", "available", "available"],
      ["available", "available", "available"],
      ["available", "available", "available", "available"],
      ["available", "available", "available", "available"],
    ],
  ];

  /// STANDARD layout (3 blocks)
  final standardSeats = [
    // Left block
    [
      ["available", "available", "available", "available"],
      ["available", "available", "available", "available"],
      ["available", "available", "available", "available"],
      ["available", "available", "available", "available"],
      ["available", "available", "available", "available"],
    ],

    // Middle block
    [
      [
        "available",
        "available",
        "available",
        "available",
        "available",
        "available",
        "available",
        "available",
      ],
      [
        "available",
        "occupied",
        "occupied",
        "occupied",
        "occupied",
        "occupied",
        "occupied",
        "available",
      ],
      [
        "available",
        "available",
        "available",
        "available",
        "available",
        "available",
        "available",
        "available",
      ],
      [
        "available",
        "available",
        "available",
        "available",
        "available",
        "available",
        "available",
        "available",
      ],
      [
        "available",
        "available",
        "available",
        "available",
        "available",
        "available",
        "available",
        "available",
      ],
    ],

    // Right block
    [
      ["available", "available", "available", "available"],
      ["available", "available", "available", "available"],
      ["available", "unavailable", "unavailable", "available"],
      ["available", "available", "available", "available"],
      ["available", "available", "available", "available"],
    ],
  ];

  void toggleSeat(List<List<String>> block, int row, int col) {
    setState(() {
      if (block[row][col] == 'available') {
        block[row][col] = 'selected';
      } else if (block[row][col] == 'selected') {
        block[row][col] = 'available';
      }
    });
  }

  // TIME SLOTS
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
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(6),
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

  // SCREEN HEADER
  Widget buildScreenHeader() {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 60,
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
              "assets/images/zoom-in.svg",
              width: 20,
              height: 20,
            ),
          ),
        ),
      ],
    );
  }

  // SEAT BLOCK BUILDER
  Widget buildSeatBlock(List<List<String>> block) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: block.asMap().entries.map((entry) {
        int rowIndex = entry.key;
        List<String> row = entry.value;

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: row.asMap().entries.map((seatEntry) {
            int colIndex = seatEntry.key;
            String status = seatEntry.value;

            Color bgColor;
            Color borderColor = Colors.white;
            switch (status) {
              case 'occupied':
                bgColor = Colors.red;
                break;
              case 'selected':
                bgColor = Colors.green;
                break;
              case 'unavailable':
                bgColor = Colors.grey;
                break;
              default:
                bgColor = Colors.transparent;
                borderColor = Colors.white;
            }

            return GestureDetector(
              onTap: status == 'occupied' || status == 'unavailable'
                  ? null
                  : () => toggleSeat(block, rowIndex, colIndex),
              child: Container(
                margin: const EdgeInsets.all(3),
                width: 22,
                height: 22,
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
                    fontSize: 9,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          }).toList(),
        );
      }).toList(),
    );
  }

  // SEAT SECTION BUILDER (arrange blocks in row)
  Widget buildSeatSection(List<List<List<String>>> seatBlocks) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: seatBlocks.asMap().entries.map((entry) {
        int blockIndex = entry.key;
        List<List<String>> block = entry.value;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: blockIndex == 1 ? 30 : 10),
          child: buildSeatBlock(block),
        );
      }).toList(),
    );
  }

  // LEGEND
  Widget buildSeatLegend() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        legendItem(Colors.green, 'Selected'),
        const SizedBox(width: 12),
        legendItem(Colors.transparent, 'Available', border: true),
        const SizedBox(width: 12),
        legendItem(Colors.red, 'Occupied'),
        const SizedBox(width: 12),
        legendItem(Colors.grey, 'Unavailable'),
      ],
    );
  }

  Widget legendItem(Color color, String label, {bool border = false}) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            border: border ? Border.all(color: Colors.white) : null,
          ),
        ),
        const SizedBox(width: 4),
        Text(label, style: const TextStyle(color: Colors.white, fontSize: 12)),
      ],
    );
  }

  // MOVIE HEADER
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
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(width: 8),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(
                  "assets/images/superman.png",
                  height: 40,
                  width: 28,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.darkBlue,
      appBar: const CustomAppBar(),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 1),
      body: Column(
        children: [
          _buildMovieHeader(context),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  buildTimeSlots(),
                  const SizedBox(height: 20),
                  buildScreenHeader(),
                  const SizedBox(height: 10),

                  // Director’s Lounge
                  Text(
                    "Director's Lounge | LKR 800.00",
                    style: TextStyles.size14SofiaProwhite,
                  ),
                  const SizedBox(height: 10),
                  buildSeatSection(directorLoungeSeats),
                  const SizedBox(height: 30),

                  // Standard
                  Text(
                    "Standard | LKR 1000.00",
                    style: TextStyles.size14SofiaProwhite,
                  ),
                  const SizedBox(height: 10),
                  buildSeatSection(standardSeats),
                  const SizedBox(height: 30),

                  buildSeatLegend(),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// SCREEN ARC PAINTER
class ScreenArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Gold line
    final goldPaint = Paint()
      ..color = AppColours.goldenYellow
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    // Blue line
    final bluePaint = Paint()
      ..color = AppColours.deepIndigo
      ..strokeWidth = 10
      ..style = PaintingStyle.stroke;

    // Gold path
    final goldPath = Path();
    goldPath.moveTo(0, size.height);
    goldPath.quadraticBezierTo(
      size.width / 2,
      -size.height / 2,
      size.width,
      size.height,
    );

    // Blue path (slightly lower)
    final bluePath = Path();
    bluePath.moveTo(0, size.height + 4);
    bluePath.quadraticBezierTo(
      size.width / 2,
      -size.height / 2 + 4,
      size.width,
      size.height + 4,
    );

    // Draw blue first
    canvas.drawPath(bluePath, bluePaint);
    // Then gold
    canvas.drawPath(goldPath, goldPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
