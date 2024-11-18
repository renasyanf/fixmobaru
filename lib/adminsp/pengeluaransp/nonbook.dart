import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fixmobb/adminsp/pengeluaransp/detailbook.dart';
import 'package:fixmobb/adminsp/pengeluaransp/booking.dart';

class NonBooking extends StatefulWidget {
  @override
  _NonBookingState createState() => _NonBookingState();
}

class _NonBookingState extends State<NonBooking> {
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
                Navigator.pop(context); // Close the drawer
                // Navigate to Sparepart page
              },
            ),
            ListTile(
              leading: Icon(Icons.inventory),
              title: Text('Pengeluaran Sparepart', style: GoogleFonts.poppins(fontSize: 16)),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Navigate to Pengeluaran Sparepart page
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Service', style: GoogleFonts.poppins(fontSize: 16)),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Navigate to Service page
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
            Center(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                color: Color(0xFF5B2D0C),
                child: Text(
                  'TABEL SPAREPART',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                ToggleButtons(
                  isSelected: [true, false],
                  color: Colors.black,
                  selectedColor: Colors.white,
                  fillColor: Color(0xFF5B2D0C),
                  borderRadius: BorderRadius.circular(5),
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text('BOOKING'),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text('NON BOOKING'),
                    ),
                  ],
                  onPressed: (int index) {
                    // Handle toggle button state here
                  },
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                DropdownButton<int>(
                  value: 10,
                  items: [10, 20, 30]
                      .map((int value) => DropdownMenuItem<int>(
                            value: value,
                            child: Text('$value entries per page'),
                          ))
                      .toList(),
                  onChanged: (value) {},
                ),
                Spacer(),
                Container(
                  width: 150,
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, size: 20),
                      hintText: 'Search',
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: 3, // Number of rows
                itemBuilder: (context, index) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 5),
                    child: ListTile(
                      title: Text(
                        'PKB20241107095551000070',
                        style: GoogleFonts.poppins(fontSize: 16),
                      ),
                      trailing: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF5B2D0C), // Button color
                        ),
                        onPressed: () {
                          // Navigate to DetailBook page
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DetailBook()),
                          );
                        },
                        child: Text(
                          'LANJUT',
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text('Prev', style: TextStyle(color: Colors.black54)),
                ),
                SizedBox(width: 10),
                ...List.generate(5, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: index == 1 ? Color(0xFF5B2D0C) : Colors.white,
                        foregroundColor: index == 1 ? Colors.white : Colors.black54,
                        minimumSize: Size(30, 30),
                      ),
                      onPressed: () {},
                      child: Text(
                        '${index + 1}',
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  );
                }),
                SizedBox(width: 10),
                TextButton(
                  onPressed: () {},
                  child: Text('Next', style: TextStyle(color: Colors.black54)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
