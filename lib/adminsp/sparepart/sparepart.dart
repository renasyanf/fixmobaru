import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sparepart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 255, 255, 255), // Brown color for AppBar
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
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Text("Prev", style: TextStyle(color: Colors.black)),
                ),
                // Wrap the number buttons inside a Wrap widget to allow flexible wrapping
                Wrap(
                  spacing: 8.0, // Space between the buttons
                  children: List.generate(5, (i) {
                    return TextButton(
                      onPressed: () {},
                      child: Text(
                        "$i",
                        style: TextStyle(
                          color: i == 2
                              ? Color.fromARGB(255, 84, 44, 9)
                              : Colors.grey,
                        ),
                      ),
                    );
                  }),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Next", style: TextStyle(color: Colors.white)),
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MadiunPage()));
                } else if (route == 'magetan') {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => MagetanPage()));
                } else if (route == 'ponorogo') {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => PonorogoPage()));
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

// Madiun Page
class MadiunPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Madiun Branch')),
      body: Center(child: Text('Madiun Branch Stock')),
    );
  }
}

// Magetan Page
class MagetanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Magetan Branch')),
      body: Center(child: Text('Magetan Branch Stock')),
    );
  }
}

// Ponorogo Page
class PonorogoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ponorogo Branch')),
      body: Center(child: Text('Ponorogo Branch Stock')),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Sparepart(),
  ));
}
