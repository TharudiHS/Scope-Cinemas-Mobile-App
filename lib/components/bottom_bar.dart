import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scope_cinemas/screens/cinemas_page.dart';
import 'package:scope_cinemas/screens/menu_page.dart';
import 'package:scope_cinemas/screens/movies_page.dart';
import 'package:scope_cinemas/screens/home_page.dart';
import 'package:scope_cinemas/screens/snacks_page.dart';
import 'package:scope_cinemas/utils/app_colours.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;

  const BottomNavBar({super.key, required this.selectedIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: AppColours.darkNavy,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _svgNavItem("assets/images/home.svg", "Home", selectedIndex == 0, () {
            if (selectedIndex != 0) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const HomePage()),
              );
            }
          }),
          _svgNavItem(
            "assets/images/movies.svg",
            "Movies",
            selectedIndex == 1,
            () {
              if (selectedIndex != 1) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const MoviesPage()),
                );
              }
            },
          ),
          _svgNavItem(
            "assets/images/cinemas.svg",
            "Cinemas",
            selectedIndex == 2,
            () {
              if (selectedIndex != 2) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const CinemasPage()),
                );
              }
            },
          ),
          _svgNavItem(
            "assets/images/snacks.svg",
            "Snacks",
            selectedIndex == 3,
            () {
              if (selectedIndex != 3) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const SnackPage()),
                );
              }
            },
          ),
          _svgNavItem("assets/images/menu.svg", "Menu", selectedIndex == 4, () {
            if (selectedIndex != 4) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const MenuPage()),
              );
            }
          }),
        ],
      ),
    );
  }

  static Widget _svgNavItem(
    String iconPath,
    String label,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 65,
            height: 45,
            decoration: BoxDecoration(
              color: isSelected ? AppColours.crimsonRed : AppColours.darkBlue,
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.all(12),
            child: SvgPicture.asset(
              iconPath,
              height: 23,
              width: 23,
              color: isSelected ? AppColours.darkBlue : Colors.white,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.w500,
              color: isSelected ? AppColours.crimsonRed : Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
