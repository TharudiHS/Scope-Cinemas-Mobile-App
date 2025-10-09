import 'package:flutter/material.dart';
import 'package:scope_cinemas/components/app_bar.dart';
import 'package:scope_cinemas/components/bottom_bar.dart';
import 'package:scope_cinemas/components/button.dart';
import 'package:scope_cinemas/screens/select_ticket_type.dart';
import 'package:scope_cinemas/utils/app_colours.dart';
import 'package:scope_cinemas/utils/text_styles.dart';

class FoodBeveragePage extends StatefulWidget {
  const FoodBeveragePage({super.key});

  @override
  State<FoodBeveragePage> createState() => _FoodBeveragePageState();
}

class _FoodBeveragePageState extends State<FoodBeveragePage> {
  final List<Map<String, dynamic>> snacks = [
    {
      "name": "Panko Prawns Burger",
      "price": 1900.00,
      "image": "assets/images/snack1.jpeg",
      "qty": 1,
    },
    {
      "name": "Cheese Melt",
      "price": 1900.00,
      "image": "assets/images/snack1.jpeg",
      "qty": 0,
    },
    {
      "name": "Crispy Chicken Burger",
      "price": 1900.00,
      "image": "assets/images/snack2.jpeg",
      "qty": 0,
    },
    {
      "name": "Nachos With Mustard",
      "price": 1900.00,
      "image": "assets/images/snack2.jpeg",
      "qty": 0,
    },
  ];

  final List<String> categories = [
    "ALL",
    "IN PROMOTION",
    "COMBOS",
    "BEVERAGES",
    "CHIPS",
    "OTHERS",
  ];

  int selectedCategory = 0;

  double get total =>
      snacks.fold(0, (sum, item) => sum + (item["price"] * item["qty"]));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.darkBlue,
      appBar: const CustomAppBar(),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 1),
      body: Column(
        children: [
          _buildHeader(context),
          const SizedBox(height: 15),
          _buildSnackTimeRow(),
          const SizedBox(height: 10),

          Container(height: 1, color: AppColours.royalIndigo.withOpacity(0.7)),
          const SizedBox(height: 20),

          // Category Tabs
          SizedBox(
            height: 35,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final isSelected = selectedCategory == index;
                return GestureDetector(
                  onTap: () => setState(() => selectedCategory = index),
                  child: Container(
                    margin: const EdgeInsets.only(right: 14),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 6,
                    ),
                    child: Text(
                      categories[index],
                      style: TextStyles.size14SofiaProwhitebold.copyWith(
                        color: isSelected
                            ? AppColours.gold
                            : Colors.white.withOpacity(0.7),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),

          // Snack List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: snacks.length,
              itemBuilder: (context, index) {
                final item = snacks[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: AppColours.deepIndigo),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Snack image
                      ClipRRect(
                        child: Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            Image.asset(
                              item["image"],
                              height: 85,
                              width: 85,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),

                      // Item info and controls
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item["name"],
                              style: TextStyles.size20SofiaProwhitelight,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              "LKR ${item["price"].toStringAsFixed(2)}",
                              style: TextStyles.size16SofiaProwhite,
                            ),
                            const SizedBox(height: 18),

                            // Quantity controls + ADD button
                            Row(
                              children: [
                                // Minus button
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if (item["qty"] > 0) item["qty"]--;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      shape: BoxShape.circle,
                                    ),
                                    padding: const EdgeInsets.all(4),
                                    child: const Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 18),

                                // Quantity text
                                Text(
                                  "${item["qty"]}",
                                  style: TextStyles.size27SofiaPro,
                                ),
                                const SizedBox(width: 18),

                                // Plus button
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      item["qty"]++;
                                    });
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      shape: BoxShape.circle,
                                    ),
                                    padding: const EdgeInsets.all(4),
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 40),

                                // ADD button
                                Container(
                                  height: 32,
                                  width: 70,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                  ),
                                  child: TextButton(
                                    onPressed: item["qty"] > 0 ? () {} : null,
                                    child: const Text(
                                      "ADD",
                                      style: TextStyles.size16SofiaPro,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      // Notes section
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Text(
                          "Note: 1. Images are for representation purposes only. 2. Prices inclusive of taxes.",
                          style: TextStyles.size12SofiaPro,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // Bottom Summary Bar
          if (total > 0)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Gold line
                  Container(
                    height: 3,
                    width: 148,
                    decoration: BoxDecoration(
                      color: AppColours.goldenYellow,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    margin: const EdgeInsets.only(bottom: 12),
                  ),

                  // Selected item row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "+ ${snacks.firstWhere((e) => e["qty"] > 0)["name"]}  x${snacks.firstWhere((e) => e["qty"] > 0)["qty"]}",
                        style: TextStyles.size20SofiaPro,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            for (var item in snacks) {
                              item["qty"] = 0;
                            }
                          });
                        },
                        child: const Icon(
                          Icons.close,
                          color: Colors.red,
                          size: 22,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 14),

                  // Continue button
                  CustomButton(
                    text: "CONTINUE TO PAY - LKR ${total.toStringAsFixed(0)}",
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (context) => const SelectTicketTypePage(),
                      );
                    },
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  // Header Widget
  Widget _buildHeader(BuildContext context) {
    return Container(
      color: AppColours.deepIndigo,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Back icon
          IconButton(
            icon: Image.asset(
              "assets/images/arrow_back.png",
              width: 35,
              height: 35,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          const SizedBox(width: 4),

          // Movie image + info
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Movie poster
                ClipRRect(
                  child: Image.asset(
                    "assets/images/superman1.jpeg",
                    height: 45,
                    width: 30,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),

                // Movie text
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("SUPERMAN", style: TextStyles.size16SofiaProwhite),
                      const SizedBox(height: 4),
                      Text(
                        "SCOPE CINEMAS - HAVELOCK CITY MALL, FRIDAY, 10 JUNE, 10:30 AM,\nGOLD CLASS 2D : L1, L2, L3",
                        style: TextStyles.size10SofiaProlight,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Snacks + Time Row
  Widget _buildSnackTimeRow() {
    return Container(
      color: AppColours.darkBlue,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("SNACKS", style: TextStyles.size17SofiaPro),
          Row(
            children: const [
              Icon(Icons.access_time, color: AppColours.goldenYellow, size: 18),
              SizedBox(width: 6),
              Text("05:00", style: TextStyles.size16SofiaProgolden),
            ],
          ),
        ],
      ),
    );
  }
}
