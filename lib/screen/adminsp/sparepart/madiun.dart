import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Madiun extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text(
          "TABEL SPAREPART",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person, color: Colors.black),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(206, 84, 44, 9),
              ),
              child: Text(
                'Menu',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.build),
              title: Text('Sparepart', style: GoogleFonts.poppins(fontSize: 16)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.inventory),
              title: Text('Pengeluaran Sparepart',
                  style: GoogleFonts.poppins(fontSize: 16)),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
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
                DropdownButton<String>(
                  value: "10",
                  items: const [
                    DropdownMenuItem(
                        value: "10", child: Text("10 entries per page")),
                    DropdownMenuItem(
                        value: "20", child: Text("20 entries per page")),
                  ],
                  onChanged: (value) {
                    // Aksi saat dropdown berubah
                  },
                ),
                SizedBox(
                  width: screenWidth * 0.5, // Sesuaikan lebar text field
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: "Search...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  headingRowColor: MaterialStateProperty.all(
                    Colors.grey.shade200,
                  ),
                  columns: const [
                    DataColumn(label: Text("NAMA")),
                    DataColumn(label: Text("KATEGORI")),
                    DataColumn(label: Text("SATUAN")),
                    DataColumn(label: Text("JUMLAH")),
                  ],
                  rows: List.generate(
                    3,
                    (index) => const DataRow(cells: [
                      DataCell(Text("RACK END FORTUNER VRZ")),
                      DataCell(Text("PART")),
                      DataCell(Text("PCS")),
                      DataCell(Text("1")),
                    ]),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.chevron_left),
                  ),
                  for (int i = 1; i <= 5; i++)
                    Padding(
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
                    ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.chevron_right),
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
