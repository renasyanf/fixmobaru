import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fixmobb/screen/adminsp/pengeluaransp/booking.dart';
import 'package:fixmobb/screen/adminsp/sparepart/sparepart.dart';
import 'package:fixmobb/screen/customer/user/book.dart';


class Dashboardsp extends StatelessWidget {
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
                Scaffold.of(context).openDrawer();
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
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Color(0xFF5B2D0C)),
              child: Text(
                'Menu',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.build),
              title: Text('Sparepart', style: GoogleFonts.poppins(fontSize: 16)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Sparepart()), 
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.inventory),
              title: Text('Pengeluaran Sparepart', style: GoogleFonts.poppins(fontSize: 16)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Booking()), // Update this to your Pengeluaran Sparepart page
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Service', style: GoogleFonts.poppins(fontSize: 16)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BookingWaktu()), // Update this to your Service page
                );
              },
            ),
          ],
        ),
      ),
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
              'Halo admin sparepart !',
              style: GoogleFonts.poppins(
                fontSize: 16,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'Data Master',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
            ),
            Divider(thickness: 1, color: Colors.black54),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  MasterCard(
                    title: 'SPAREPART',
                    imagePath: 'assets/images/ban.png',
                    onTap: () {
                     Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Sparepart()),
                      );
                    },
                  ),
                  SizedBox(height: 15),
                  MasterCard(
                    title: 'PENGELUARAN SPAREPART',
                    imagePath: 'assets/images/ban.png',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Booking()),
                      );
                    },
                  ),
                  SizedBox(height: 15),
                  MasterCard(
                    title: 'SERVICE',
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
