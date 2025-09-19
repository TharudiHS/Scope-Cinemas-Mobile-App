import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:scope_cinemas/utils/app_colours.dart';

import 'package:scope_cinemas/utils/text_styles.dart';
import 'package:scope_cinemas/components/app_bar.dart';
import 'package:scope_cinemas/components/bottom_bar.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _controller = TextEditingController();

  final List<String> suggestions = [
    "Superman",
    "Jurassic World: Rebirth",
    "Dog Man",
    "Captain America: Brave New World",
  ];

  String query = "";

  @override
  Widget build(BuildContext context) {
    final filtered = suggestions
        .where((s) => s.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(),
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/search_bg.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Black transparent overlay
          Container(color: Colors.black.withOpacity(0.8)),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const SizedBox(height: 12),

                  //Search field
                  Container(
                    decoration: BoxDecoration(color: Colors.white),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 15,
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.search, color: AppColours.darkBlue),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: _controller,
                            onChanged: (val) => setState(() => query = val),
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            debugPrint("Search: ${_controller.text}");
                          },
                          child: SvgPicture.asset(
                            "assets/images/arrow-83.svg",
                            height: 22,
                            width: 22,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Dummy data table
                  Container(
                    decoration: BoxDecoration(color: Colors.white),
                    child: ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: filtered.length,
                      separatorBuilder: (_, __) =>
                          const Divider(height: 1, color: AppColours.paleLilac),
                      itemBuilder: (context, index) {
                        final item = filtered[index];
                        return InkWell(
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Selected: $item")),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 23,
                            ),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.search,
                                  color: AppColours.royalIndigo,
                                ),
                                const SizedBox(width: 12),
                                Text(
                                  item,
                                  style: TextStyles.size16SofiaProroyalIndigo,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      // Bottom nav bar
      bottomNavigationBar: const BottomNavBar(selectedIndex: 0),
    );
  }
}
