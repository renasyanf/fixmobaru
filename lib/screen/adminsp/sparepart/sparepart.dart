import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fixmobb/screen/adminsp/sparepart/magetan.dart';
import 'package:fixmobb/screen/adminsp/sparepart/ponorogo.dart';
import 'package:fixmobb/screen/adminsp/sparepart/madiun.dart';

class Sparepart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Text(
          "TABEL DATA CABANG",
          style: TextStyle(color: Color(0xFF5B2D0C)),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.person, color: Colors.black),
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
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.inventory),
              title: Text('Pengeluaran Sparepart', style: GoogleFonts.poppins(fontSize: 16)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Service', style: GoogleFonts.poppins(fontSize: 16)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<int>(
                  value: 10,
                  items: [10, 20, 50, 100].map((int value) {
                    return DropdownMenuItem<int>(
                      value: value,
                      child: Text("$value entries per page"),
                    );
                  }).toList(),
                  onChanged: (value) {},
                ),
                SizedBox(width: 8),
                Container(
                  width: 150,
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "search :",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Container(
              color: Colors.grey[300],
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Text(
                    "NAMA CABANG",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  )),
                  Expanded(
                      child: Text(
                    "ALAMAT",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  )),
                  Expanded(
                      child: Text(
                    "INDUK CABANG",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  )),
                  SizedBox(width: 8), // For spacing with button
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  _buildDataRow(context, "Garage 86 Madiun", "JL Sawo no.14", "Garage 86 Magetan", 'madiun'),
                  _buildDataRow(context, "Garage 86 Magetan", "JL Pahlawan no.4", "Induk Cabang Utama", 'magetan'),
                  _buildDataRow(context, "Garage 86 Ponorogo", "JL Pahlawan no.4", "Garage 86 Magetan", 'ponorogo'),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.chevron_left),
                ),
                // Wrap the pagination buttons in a SingleChildScrollView
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal, // Allow horizontal scrolling
                  child: Row(
                    children: List.generate(5, (i) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: i == 2
                              ? const Color.fromARGB(206, 84, 44, 9)
                              : Colors.grey.shade200,
                        ),
                        child: Text(
                          "$i",
                          style: TextStyle(
                            color: i == 2 ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    )),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.chevron_right),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataRow(BuildContext context, String branchName, String address, String parentBranch, String route) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(branchName, style: TextStyle(color: Colors.black))),
            Expanded(child: Text(address, style: TextStyle(color: Colors.black))),
            Expanded(child: Text(parentBranch, style: TextStyle(color: Colors.white))),
            SizedBox(width: 8),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 84, 44, 9),
              ),
              onPressed: () {
                // Navigate to the corresponding branch page
                if (route == 'madiun') {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Madiun()));
                } else if (route == 'magetan') {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => IndukCab()));
                } else if (route == 'ponorogo') {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Ponorogo()));
                }
              },
              child: Text(
                "CEK STOK",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Sparepart(),
  ));
}
