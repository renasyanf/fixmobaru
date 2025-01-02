import 'package:flutter/material.dart';
import 'package:fixmobb/screen/customer/dashboard.dart';
import 'package:fixmobb/screen/customer/roomchat.dart'; 
import 'package:fixmobb/screen/customer/aktivitas/aktivitas.dart';
import 'package:fixmobb/screen/customer/promo.dart';

class NavbarPage extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const NavbarPage({Key? key, required this.currentIndex, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,  // Set the current index
      onTap: (index) {
        onTap(index); // Call the onTap function
        // Handle navigation based on selected index
        switch (index) {
          case 0:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => Dashboard()), // Navigate to Dashboard on Home tab click
            );
            break;
          case 1:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => PromoPage()), // Navigate to Promo page
            );
            break;
          case 2:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AktivitasPage()), // Navigate to Aktivitas page
            );
            break;
          case 3:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => RoomChatPage()), // Navigate to RoomChat page
            );
            break;
          default:
            break;
        }
      },
      selectedItemColor: Color.fromARGB(206, 84, 44, 9),  // Set selected item color to brown
      unselectedItemColor: Color.fromARGB(206, 84, 44, 9),  // Set unselected item color to brown
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.local_offer),
          label: 'Promo',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.assignment),
          label: 'Aktivitas',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat),
          label: 'Chat',
        ),
      ],
    );
  }
}
