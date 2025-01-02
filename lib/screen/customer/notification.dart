import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  bool isNotificationTab = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('NOTIFIKASI', style: GoogleFonts.poppins()),
        centerTitle: true,
        backgroundColor: Color.fromARGB(206, 84, 44, 9),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.chat_bubble_outline),
            onPressed: () {
              // Navigate to chat page
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Tab Buttons for Notification and Status
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isNotificationTab = true;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: isNotificationTab
                          ? Color.fromARGB(206, 84, 44, 9)
                          : Colors.white,
                      side: BorderSide(
                          color: Color.fromARGB(206, 84, 44, 9), width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Notification',
                      style: GoogleFonts.poppins(
                        color: isNotificationTab
                            ? Colors.white
                            : Color.fromARGB(206, 84, 44, 9),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isNotificationTab = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: !isNotificationTab
                          ? Color.fromARGB(206, 84, 44, 9)
                          : Colors.white,
                      side: BorderSide(
                          color: Color.fromARGB(206, 84, 44, 9), width: 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(
                      'Status',
                      style: GoogleFonts.poppins(
                        color: !isNotificationTab
                            ? Colors.white
                            : Color.fromARGB(206, 84, 44, 9),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          // List of Notifications or Status
          Expanded(
            child: ListView(
              children: [
                _buildNotificationItem(
                  title: 'Voucher FixMob',
                  description: 'Selamat, anda mendapatkan potongan harga',
                  icon: Icons.local_offer,
                ),
                _buildNotificationItem(
                  title: 'Selamat !',
                  description:
                      'Selamat, anda telah berhasil melakukan registrasi',
                  icon: Icons.check_circle_outline,
                ),
                _buildOrderStatusCard(
                  imageUrl: 'assets/images/sparepart.png', // Replace with actual image asset
                  status: 'Pesanan Diproses',
                  description:
                      'Pesanan AR62UOW090 sedang diproses di bengkel A',
                ),
              ],
            ),
          ),
        ],
      ),
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
        currentIndex: 2, // Change as needed
        selectedItemColor: Color.fromARGB(206, 84, 44, 9),
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          // Handle navigation based on index
        },
      ),
    );
  }

  Widget _buildNotificationItem({
    required String title,
    required String description,
    required IconData icon,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: Color.fromARGB(206, 84, 44, 9),
      ),
      title: Text(
        title,
        style: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(206, 84, 44, 9),
        ),
      ),
      subtitle: Text(
        description,
        style: GoogleFonts.poppins(color: Colors.grey.shade700),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16),
      onTap: () {
        // Handle notification tap
      },
    );
  }

  Widget _buildOrderStatusCard({
    required String imageUrl,
    required String status,
    required String description,
  }) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Color.fromARGB(206, 150, 80, 30),
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: Image.asset(
          imageUrl,
          width: 50,
          height: 50,
        ),
        title: Text(
          status,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        subtitle: Text(
          description,
          style: GoogleFonts.poppins(color: Colors.white70),
        ),
      ),
    );
  }
}
