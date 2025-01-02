import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:fixmobb/adminsa/master/mekanik/tambah.dart'; 
// import 'package:fixmobb/adminsa/master/mekanik/edit.dart'; 
import 'package:fixmobb/screen/adminsa/sidebar.dart';

class Mekanik extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text(
          "TABEL MEKANIK",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person, color: Colors.black),
          ),
        ],
      ),
      drawer: Sidebar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Sidebar()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(206, 84, 44, 9),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  child: Text(
                    "TAMBAH MEKANIK",
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
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
                  width: screenWidth * 0.5,
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
                    DataColumn(label: Text("KODE MEKANIK")),
                    DataColumn(label: Text("NAMA MEKANIK")),
                    DataColumn(label: Text("KOTA")),
                    DataColumn(label: Text("KEAHLIAN")),
                    DataColumn(label: Text("AKSI")),
                  ],
                  rows: List.generate(
                    3,
                    (index) => DataRow(cells: [
                      DataCell(Text("MKN${index + 1}")),
                      DataCell(Text("Mekanik ${index + 1}")),
                      DataCell(Text("Kota ${index + 1}")),
                      DataCell(Text("Keahlian ${index + 1}")),
                      DataCell(PopupMenuButton<String>(
                        onSelected: (String value) {
                          if (value == 'edit') {
                            print("Edit clicked");
                          } else if (value == 'detail') {
                            print("Detail clicked");
                          } else if (value == 'delete') {
                            print("Delete clicked");
                          }
                        },
                        itemBuilder: (BuildContext context) => [
                          const PopupMenuItem<String>(
                            value: 'edit',
                            child: Text('Edit'),
                          ),
                          const PopupMenuItem<String>(
                            value: 'detail',
                            child: Text('Detail'),
                          ),
                          const PopupMenuItem<String>(
                            value: 'delete',
                            child: Text('Delete'),
                          ),
                        ],
                      )),
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
