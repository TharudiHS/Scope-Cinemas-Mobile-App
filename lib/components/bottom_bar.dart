import 'package:flutter/material.dart';
import 'package:scope_cinemas/utils/app_colours.dart';

class CustomBottomBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColours.darkBlue,
      selectedItemColor: AppColours.crimsonRed,
      unselectedItemColor: Colors.white,
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(icon: const Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
          icon: Container(
            decoration: BoxDecoration(
              color: currentIndex == 1
                  ? AppColours.crimsonRed
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(6),
            child: const Icon(Icons.movie),
          ),
          label: 'Movies',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.location_on),
          label: 'Cinemas',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.local_drink),
          label: 'Snacks',
        ),
        const BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu'),
      ],
      selectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
