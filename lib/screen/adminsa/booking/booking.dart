import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:fixmobb/screen/adminsa/sidebar.dart';

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  DateTime selectedDate = DateTime.now();
  String selectedPageSize = "10";
  int currentPage = 1;
  String statusFix = "FIX"; 
  String statusProses = "Menunggu Dikerjakan"; 

  // Format tanggal
  String get formattedDate => DateFormat('dd/MM/yyyy').format(selectedDate);

  // Kontroler untuk input dialog
  final TextEditingController saranController = TextEditingController();

  @override
  void dispose() {
    saranController.dispose(); // Membersihkan kontroler
    super.dispose();
  }

  // Fungsi untuk menampilkan dialog popup
  void showSaranDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Isi Saran"),
          content: TextField(
            controller: saranController,
            decoration: const InputDecoration(hintText: "Masukkan saran di sini"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Menutup dialog
              },
              child: const Text("Tutup"),
            ),
            ElevatedButton(
              onPressed: () {
                print("Saran disimpan: ${saranController.text}");
                Navigator.pop(context); // Menutup dialog
              },
              child: const Text("Simpan"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu, color: Colors.black),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: const Text(
          "Booking",
          style: TextStyle(color: Colors.black),
        ),
      ),
      drawer: Sidebar(),
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
                        formattedDate,
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
                    DataColumn(label: Text("TANGGAL MASUK")),
                    DataColumn(label: Text("NO POL")),
                    DataColumn(label: Text("PEMBUAT")),
                    DataColumn(label: Text("STATUS PROSES")),
                    DataColumn(label: Text("STATUS FIX")),
                    DataColumn(label: Text("SARAN")),
                    DataColumn(label: Text("DITANGANI OLEH")),
                    DataColumn(label: Text("FUNGSI")),
                  ],
                  rows: [
                    DataRow(cells: [
                      const DataCell(Text("SUTRIS TOKO BESI")),
                      const DataCell(Text("27/11/2024")),
                      const DataCell(Text("AE 1645 CR")),
                      const DataCell(Text("Dian")),
                      DataCell(
                        DropdownButton<String>(
                          value: statusProses,
                          items: const [
                            DropdownMenuItem(value: "Menunggu Dikerjakan", child: Text("Menunggu Dikerjakan")),
                            DropdownMenuItem(value: "Dikerjakan", child: Text("Dikerjakan")),
                            DropdownMenuItem(value: "Selesai", child: Text("Selesai")),
                          ],
                          onChanged: (value) {
                            setState(() {
                              statusProses = value!;
                            });
                          },
                        ),
                      ),
                      DataCell(
                        Row(
                          children: [
                            Radio<String>(
                              value: "FIX",
                              groupValue: statusFix,
                              onChanged: (value) {
                                setState(() {
                                  statusFix = value!;
                                });
                              },
                            ),
                            const Text("Fix"),
                            Radio<String>(
                              value: "NON FIX",
                              groupValue: statusFix,
                              onChanged: (value) {
                                setState(() {
                                  statusFix = value!;
                                });
                              },
                            ),
                            const Text("Not Fix"),
                          ],
                        ),
                      ),
                      DataCell(
                        TextButton(
                          onPressed: showSaranDialog,
                          child: const Text("Tambah Saran"),
                        ),
                      ),
                      const DataCell(Text("Dian")), // Ditangani Oleh
                      const DataCell(Text("Perbaikan")), // Fungsi
                    ]),
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
