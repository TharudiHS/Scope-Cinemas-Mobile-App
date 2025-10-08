import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scope_cinemas/components/app_bar.dart';
import 'package:scope_cinemas/components/bottom_bar.dart';
import 'package:scope_cinemas/utils/app_colours.dart';
import 'package:scope_cinemas/utils/text_styles.dart';

class SnackPage extends StatefulWidget {
  const SnackPage({super.key});

  @override
  State<SnackPage> createState() => _SnackPageState();
}

class _SnackPageState extends State<SnackPage> {
  int selectedCategory = 0;

  final List<String> categories = [
    "ALL",
    "IN PROMOTION",
    "COMBOS",
    "BEVERAGES",
    "CHIPS",
    "OTHERS",
  ];

  final List<Map<String, dynamic>> snacks = [
    {
      "name": "Panko Prawns \nBurger",
      "price": "LKR 1900.00",
      "image": "assets/images/snack1.jpeg",
    },
    {
      "name": "Nachos With \nMustard",
      "price": "LKR 1900.00",
      "image": "assets/images/snack2.jpeg",
    },
    {
      "name": "Panko Prawns \nBurger",
      "price": "LKR 1900.00",
      "image": "assets/images/snack1.jpeg",
    },
    {
      "name": "Nachos With \nMustard",
      "price": "LKR 1900.00",
      "image": "assets/images/snack2.jpeg",
    },
    {
      "name": "Panko Prawns \nBurger",
      "price": "LKR 1900.00",
      "image": "assets/images/snack1.jpeg",
    },
    {
      "name": "Nachos With \nMustard",
      "price": "LKR 1900.00",
      "image": "assets/images/snack2.jpeg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.darkBlue,
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Title
            const Text("SNACKS", style: TextStyles.size24SofiaPro),
            const SizedBox(height: 10),
            Container(
              height: 1,
              color: AppColours.royalIndigo.withOpacity(0.7),
            ),
            const SizedBox(height: 25),

            // Search Bar
            Container(
              height: 55,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border(
                  bottom: BorderSide(color: Colors.white.withOpacity(0.2)),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: TextStyles.size17SofiaProlightGrey,
                      decoration: InputDecoration(
                        hintText: "Search Food and Beverages..",
                        hintStyle: TextStyles.size17SofiaProlightGrey,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  SvgPicture.asset(
                    "assets/images/search-190.svg",
                    width: 18,
                    height: 18,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),

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

            // Snack Cards Grid
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.only(bottom: 12),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,

                  mainAxisExtent: 300,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 16,
                ),
                itemCount: snacks.length,
                itemBuilder: (context, index) {
                  final snack = snacks[index];
                  return _buildSnackTile(
                    snack["name"],
                    snack["price"],
                    snack["image"],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 3),
    );
  }

  Widget _buildSnackTile(String name, String price, String imagePath) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          decoration: BoxDecoration(color: AppColours.deepIndigo),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
          child: Column(
            children: [
              //  image
              SizedBox(
                height: 120,
                child: Center(
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),

                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              // Food Name
              Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyles.size16SofiaProwhitelight,
              ),
              const SizedBox(height: 8),
              // Price
              Text(price, style: TextStyles.size14SofiaProwhitemedium),
            ],
          ),
        ),

        const SizedBox(height: 12),

        // ORDER NOW button
        SizedBox(
          height: 48,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              foregroundColor: AppColours.darkBlue,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.zero,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
            child: Text("ORDER NOW", style: TextStyles.size16SofiaPro),
          ),
        ),
      ],
    );
  }
}
