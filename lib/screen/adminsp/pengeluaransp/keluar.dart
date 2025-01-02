import 'package:flutter/material.dart';

class PengeluaranSparepartPage extends StatefulWidget {
  @override
  _PengeluaranSparepartPageState createState() => _PengeluaranSparepartPageState();
}

class _PengeluaranSparepartPageState extends State<PengeluaranSparepartPage> {
  List<Map<String, dynamic>> dataSparepart = [
    {
      "tanggal": "2024-11-15 17:10:00",
      "noPkb": "1018272625117",
      "part": "FILTER UDARA (1)",
      "status": "Belum Diverifikasi",
    },
  ];

  void _verifikasi(int index) {
    setState(() {
      dataSparepart[index]['status'] = "Sudah Terverifikasi";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: const Text(
          'TABEL PENGELUARAN SPAREPART',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person, color: Colors.black),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: const [
            DrawerHeader(child: Text("Menu")),
            ListTile(leading: Icon(Icons.home), title: Text("Home")),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color.fromARGB(206, 84, 44, 9),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'TABEL PENGELUARAN SPAREPART',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 16),
            // Dropdown dan Search
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DropdownButton<String>(
                  value: "10",
                  items: const [
                    DropdownMenuItem(value: "10", child: Text("10 entries per page")),
                    DropdownMenuItem(value: "20", child: Text("20 entries per page")),
                  ],
                  onChanged: (value) {
                    // Aksi dropdown
                  },
                ),
                SizedBox(
                  width: 200,
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
            // Tabel Data
            Expanded(
              child: ListView(
                children: [
                  DataTable(
                    headingRowColor: MaterialStateProperty.all(
                      Colors.grey.shade200,
                    ),
                    columns: const [
                      DataColumn(label: Text("TANGGAL")),
                      DataColumn(label: Text("NO. PKB")),
                      DataColumn(label: Text("PART")),
                      DataColumn(label: Text("STATUS")),
                    ],
                    rows: List.generate(
                      dataSparepart.length,
                      (index) {
                        final item = dataSparepart[index];
                        return DataRow(cells: [
                          DataCell(Text(item['tanggal'])),
                          DataCell(Text(item['noPkb'])),
                          DataCell(Text(item['part'])),
                          DataCell(
                            item['status'] == "Belum Diverifikasi"
                                ? ElevatedButton(
                                    onPressed: () => _verifikasi(index),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                    ),
                                    child: const Text(
                                      'Verifikasi',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )
                                : const Text(
                                    'Sudah Terverifikasi',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                          ),
                        ]);
                      },
                    ),
                  ),
                ],
              ),
            ),
            // Pagination
            Row(
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
                        // Aksi untuk pindah halaman
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            i == 2 ? const Color.fromARGB(206, 84, 44, 9) : Colors.grey.shade200,
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
                    // Aksi halaman berikutnya
                  },
                  icon: const Icon(Icons.chevron_right),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
