import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fixmobb/screen/customer/sparepart/search.dart';
import 'package:fixmobb/screen/customer/servis/oli.dart';
import 'package:fixmobb/screen/customer/widgets/navbar.dart';
import 'package:fixmobb/screen/customer/chat.dart';
import 'package:fixmobb/screen/customer/aktivitas/aktivitas.dart';
import 'package:fixmobb/screen/customer/roomchat.dart';
import 'package:fixmobb/screen/customer/dashboard.dart';
import 'package:fixmobb/screen/customer/promo.dart';

class PromoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Promotions'),
        backgroundColor: Color.fromARGB(206, 84, 44, 9), // Main color
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildPromoSection(
              title: 'Special Service Offer',
              description: 'Get 20% off on all service bookings this month!',
              imageUrl: 'assets/images/ac.png', // Replace with your service image
              buttonText: 'Book Now',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ServiceOli(),
                  ),
                );
              },
            ),
            _buildPromoSection(
              title: 'Spare Parts Discount',
              description: 'Buy one, get one free on selected spare parts!',
              imageUrl: 'assets/images/ac.png', // Replace with your spare part image
              buttonText: 'Shop Now',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SparepartPage(), // Navigate to the spare parts page
                  ),
                );
              },
            ),
          ],
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Beranda',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer),
            label: 'Promo',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Aktivitas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chat',
          ),
        ],
        currentIndex: 1, // Promo page is selected
        selectedItemColor: Color.fromARGB(206, 84, 44, 9), // Selected item color
        unselectedItemColor: Colors.grey, // Unselected item color
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Dashboard()), // Navigate to Beranda page
            );
          } else if (index == 1) {
            // Do nothing since we are already on the Promo page
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AktivitasPage()), // Navigate to Aktivitas page
            );
          } else if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => RoomChatPage()), // Navigate to Chat page
            );
          }
        },
      ),
    );
  }

  Widget _buildPromoSection({
    required String title,
    required String description,
    required String imageUrl,
    required String buttonText,
    required VoidCallback onPressed,
  }) {
    return Container(
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              imageUrl,
              fit: BoxFit.cover,
              width: double.infinity,
              height: 150,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color.fromARGB(206, 84, 44, 9), // Title color
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  description,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey.shade700,
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: onPressed,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(206, 150, 80, 30), // Accent color for button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(buttonText),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
