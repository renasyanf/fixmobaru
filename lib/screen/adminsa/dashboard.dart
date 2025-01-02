import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fixmobb/screen/adminsa/wo/wo.dart';
import 'package:fixmobb/screen/adminsp/pengeluaransp/booking.dart';
import 'package:fixmobb/screen/adminsp/sparepart/sparepart.dart';
import 'package:fixmobb/screen/adminsa/sidebar.dart'; 
import 'package:fixmobb/screen/adminsa/fixation/fixation.dart'; 
import 'package:fixmobb/screen/adminsa/booking/booking.dart'; 
import 'package:fixmobb/screen/adminsa/master/datamaster.dart'; 

class Admin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: Icon(Icons.menu, color: Colors.black),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Open the sidebar drawer
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person_outline, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Sidebar(), // Use the imported Sidebar widget here
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dashboard',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 5),
            Text(
              'Halo admin !',
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            Divider(thickness: 1, color: Colors.black54),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  MasterCard(
                    title: 'PENDAFTARAN SERVICE',
                    imagePath: 'assets/images/ban.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Workoder()),
                      );
                    },
                  ),
                  SizedBox(height: 15),
                  MasterCard(
                    title: 'BOOKING',
                    imagePath: 'assets/images/ban.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => BookingPage()),
                      );
                    },
                  ),
                  SizedBox(height: 15),
                  MasterCard(
                    title: 'FIXATION',
                    imagePath: 'assets/images/ban.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Fixation()),
                      );
                    },
                  ),
                  SizedBox(height: 15),
                  MasterCard(
                    title: 'DATA MASTER',
                    imagePath: 'assets/images/ban.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Datamaster()),
                      );
                    },
                  ),
                  SizedBox(height: 15),
                  MasterCard(
                    title: 'LAPORAN KEUANGAN',
                    imagePath: 'assets/images/ban.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Booking()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MasterCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final VoidCallback onTap;

  MasterCard({required this.title, required this.imagePath, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Image.asset(
                imagePath,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
              SizedBox(width: 20),
              Expanded(
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
