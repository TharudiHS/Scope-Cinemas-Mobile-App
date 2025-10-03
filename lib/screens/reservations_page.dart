// lib/screens/reservations_page.dart
import 'package:flutter/material.dart';
import 'package:scope_cinemas/components/app_bar.dart';
import 'package:scope_cinemas/components/bottom_bar.dart';
import 'package:scope_cinemas/screens/booking_history_page.dart';
import 'package:scope_cinemas/utils/app_colours.dart';
import 'package:scope_cinemas/utils/text_styles.dart';

class ReservationsPage extends StatelessWidget {
  const ReservationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColours.darkBlue,
      appBar: const CustomAppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
        children: [
          const Text("MY RESERVATIONS", style: TextStyles.size24SofiaPro),
          const SizedBox(height: 10),
          Container(height: 1, color: AppColours.royalIndigo.withOpacity(0.7)),
          const SizedBox(height: 25),
          const Text("Booking History", style: TextStyles.size14SofiaProwhite),
          const SizedBox(height: 20),

          // Reservation Card 1
          _reservationCard(
            context,
            cinema: "Scope Cinemas - Havelock City Mall",
            status: "Booked",
            movie: "Superman",
            date: "Thursday, 15 Jan, 2025  10:30 AM",
            seats: "Standard - \nL1, L2, L3",
            price: "LKR 925.00",
          ),
          const SizedBox(height: 16),

          // Reservation Card 2
          _reservationCard(
            context,
            cinema: "Scope Cinemas Multiplex - Colombo City \nCentre",
            status: "Booked",
            movie: "AKASA KUSUM ආකාස කුසුම්- \n(SINHALA RERELEASE)",
            date: "Thursday, 25 Jan, 2025  10:30 AM",
            seats: "Standard - \nL1, L2, L3, L4, L5, \nL6, L7",
            price: "LKR 6025.00",
          ),
          const SizedBox(height: 30),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(selectedIndex: 4),
    );
  }

  // Reservation Card Widget
  Widget _reservationCard(
    BuildContext context, {
    required String cinema,
    required String status,
    required String movie,
    required String date,
    required String seats,
    required String price,
  }) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: AppColours.deepIndigo),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cinema Name + Status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  cinema,
                  style: TextStyles.size14SofiaProwhite,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(status, style: TextStyles.size16SofiaProregular),
            ],
          ),
          const SizedBox(height: 8),
          // Movie Title
          Text(
            movie,
            style: TextStyles.size16SofiaProwhite.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          // Date & Time
          Text(date, style: TextStyles.size14SofiaProwhite),
          const SizedBox(height: 14),
          Container(height: 1, color: AppColours.royalIndigo.withOpacity(0.5)),
          const SizedBox(height: 14),
          // Seats + Price + View E-Ticket
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(seats, style: TextStyles.size14SofiaProwhite),
              ),
              Text(price, style: TextStyles.size16SofiaProgold),
              const SizedBox(width: 16),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BookingHistoryPage(),
                    ),
                  );
                },
                child: Text("VIEW E-TICKET", style: TextStyles.size14SofiaPro),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
