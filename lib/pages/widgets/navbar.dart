import 'package:flutter/material.dart';
import 'package:fixmobb/pages/aktivitas/aktivitas.dart'; 
import 'package:fixmobb/pages/promo.dart'; // Import your promo page
import 'package:fixmobb/pages/roomchat.dart'; // Import your chat page

class BottomNavigationBarWidget extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavigationBarWidget({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
      currentIndex: currentIndex,
      onTap: (index) {
        if (index == 1) {
          // Navigate to the Promo page when the "Promo" button is pressed
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PromoPage()), // Ensure PromoPage is your promo.dart widget
          );
        } else if (index == 2) {
          // Navigate to the Aktivitas page when the "Aktivitas" button is pressed
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AktivitasPage()),
          );
        } else if (index == 3) {
          // If the chat item is tapped, navigate to RoomChatPage
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RoomChatPage()),
          );
        } else {
          // Call the onTap handler for other tabs
          onTap(index);
        }
      },
      selectedItemColor: Color.fromARGB(206, 84, 44, 9), // Selected item color
      unselectedItemColor: Colors.grey, // Unselected item color
    );
  }
}
