import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart'; 
import 'package:fixmobb/screen/adminsa/sidebar.dart';

class Fixation extends StatefulWidget {
  @override
  _FixationState createState() => _FixationState();
}

class _FixationState extends State<Fixation> {
  DateTime selectedDate = DateTime.now();
  String selectedPageSize = "10";
  int currentPage = 1;
  String status = "FIX";  // Status default

  // Format tanggal
  String get formattedDate => DateFormat('dd/MM/yyyy').format(selectedDate);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.black), // Tombol menu untuk membuka sidebar
            onPressed: () {
              // Membuka sidebar (drawer) ketika tombol menu ditekan
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: const Text(
          "FIXATION",
          style: TextStyle(color: Colors.black),
        ),
      ),
      drawer: Sidebar(), // Menggunakan widget Sidebar yang diimpor
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Baris tanggal dan dropdown
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () async {
                        final DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: selectedDate,
                          firstDate: DateTime(2020),
                          lastDate: DateTime(2101),
                        );
                        if (pickedDate != null && pickedDate != selectedDate) {
                          setState(() {
                            selectedDate = pickedDate;
                          });
                        }
                      },
                      child: Text(
                        formattedDate,  // Menampilkan tanggal yang diformat
                        style: GoogleFonts.poppins(fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 5),
                    DropdownButton<String>(
                      value: selectedPageSize,
                      items: const [
                        DropdownMenuItem(value: "10", child: Text("10 entri per halaman")),
                        DropdownMenuItem(value: "20", child: Text("20 entri per halaman")),
                        DropdownMenuItem(value: "50", child: Text("50 entri per halaman")),
                      ],
                      onChanged: (value) {
                        setState(() {
                          selectedPageSize = value!;
                        });
                      },
                    ),
                  ],
                ),
                SizedBox(
                  width: 200,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.search),
                      hintText: "Cari...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Tabel Data
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  headingRowColor: MaterialStateProperty.all(Colors.grey.shade200),
                  columns: const [
                    DataColumn(label: Text("PEMILIK")),
                    DataColumn(label: Text("NOPOL")),
                    DataColumn(label: Text("NO. PKB")),
                    DataColumn(label: Text("KETERANGAN")),
                    DataColumn(label: Text("STATUS")),
                    DataColumn(label: Text("AKSI")), // Kolom baru untuk tombol Edit dan Delete
                  ],
                  rows: [
                    DataRow(cells: [
                      const DataCell(Text("BKD PEMKAP MGT")),
                      const DataCell(Text("AE 1057 NP")),
                      const DataCell(Text("PKB20241107095551000070")),
                      const DataCell(Text("Menginap")),
                      DataCell(
                        Row(
                          children: [
                            Row(
                              children: [
                                Radio<String>(
                                  value: "FIX",
                                  groupValue: status,
                                  onChanged: (value) {
                                    setState(() {
                                      status = value!;
                                    });
                                  },
                                ),
                                const Text("Fix"),
                              ],
                            ),
                            Row(
                              children: [
                                Radio<String>(
                                  value: "NON FIX",
                                  groupValue: status,
                                  onChanged: (value) {
                                    setState(() {
                                      status = value!;
                                    });
                                  },
                                ),
                                const Text("Not Fix"),
                              ],
                            ),
                          ],
                        ),
                      ),
                      DataCell(
                        Row(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                // Aksi ketika tombol Edit ditekan
                                print("Edit PKB20241107095551000070");
                                // Menambahkan dialog atau navigasi ke halaman edit
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                // Aksi ketika tombol Delete ditekan
                                print("Delete PKB20241107095551000070");
                                // Bisa menambahkan konfirmasi sebelum menghapus
                              },
                            ),
                          ],
                        ),
                      ),
                    ]),

                    // Baris tambahan sesuai kebutuhan

                  ],
                ),
              ),
            ),
            
            // Pagination
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.chevron_left),
                    onPressed: () {
                      setState(() {
                        if (currentPage > 1) currentPage--;
                      });
                    },
                  ),
                  Wrap(
                    spacing: 4,
                    children: List.generate(5, (index) {
                      final pageNumber = index + 1;
                      return ElevatedButton(
                        onPressed: () {
                          setState(() {
                            currentPage = pageNumber;
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: currentPage == pageNumber
                              ? const Color.fromARGB(206, 84, 44, 9)
                              : Colors.grey.shade200,
                        ),
                        child: Text(
                          "$pageNumber",
                          style: TextStyle(
                            color: currentPage == pageNumber
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      );
                    }),
                  ),
                  IconButton(
                    icon: const Icon(Icons.chevron_right),
                    onPressed: () {
                      setState(() {
                        currentPage++;
                      });
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
