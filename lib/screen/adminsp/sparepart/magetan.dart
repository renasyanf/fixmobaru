import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fixmobb/screen/adminsp/sparepart/tambah.dart';
import 'package:fixmobb/screen/adminsp/sparepart/pusat/edit.dart';
import 'package:fixmobb/screen/adminsp/sparepart/pusat/detail.dart';

class IndukCab extends StatelessWidget {
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ElevatedButton(
                  onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TambahSparepart()),
                      );
                    },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(206, 84, 44, 9),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                  ),
                  child: Text(
                    "TAMBAH SPAREPART",
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
                    DataColumn(label: Text("AKSI")),
                  ],
                  rows: List.generate(
                    3,
                    (index) => DataRow(cells: [
                      const DataCell(Text("RACK END FORTUNER VRZ")),
                      const DataCell(Text("PART")),
                      const DataCell(Text("PCS")),
                      const DataCell(Text("1")),
                      DataCell(PopupMenuButton<String>(
                        onSelected: (String value) {
                          if (value == 'edit') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditSparepart(
                                  sparepart: {
                                    "nama": "RACK END FORTUNER VRZ",
                                    "kategori": "PART",
                                    "satuan": "PCS",
                                    "jumlah": "1",
                                  },
                                ),
                              ),
                            );
                          } else if (value == 'detail') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailSparepartPage(
                                  sparepart: {
                                    "nama": "RACK END FORTUNER VRZ",
                                    "kategori": "PART",
                                    "satuan": "PCS",
                                    "jumlah": "1",
                                  },
                                ),
                              ),
                            );
                          } else if (value == 'delete') {
                            _showDeleteConfirmation(context);
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
                    onPressed: () {
                    },
                    icon: const Icon(Icons.chevron_left),
                  ),
                  for (int i = 1; i <= 5; i++)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 4.0),
                      child: ElevatedButton(
                        onPressed: () {
                        },
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
                    onPressed: () {
                    },
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

  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Hapus Sparepart"),
          content: const Text("Apakah Anda yakin ingin menghapus sparepart ini?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Batal"),
            ),
            ElevatedButton(
              onPressed: () {
                // Aksi hapus data
                Navigator.pop(context); // Tutup dialog
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
              ),
              child: const Text("Hapus"),
            ),
          ],
        );
      },
    );
  }
}
