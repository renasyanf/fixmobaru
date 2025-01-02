import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailWO extends StatelessWidget {
  final Map<String, dynamic> dataWO;

  DetailWO({required this.dataWO});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(206, 236, 236, 236),
        title: Text(
          "Detail WO",
          style: GoogleFonts.poppins(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Informasi Detail WO",
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Tampilkan data WO
            _buildDetailRow("Tanggal", dataWO['tanggal']),
            _buildDetailRow("Kendaraan", dataWO['kendaraan']),
            _buildDetailRow("KM Sekarang", dataWO['kmSekarang']),
            _buildDetailRow("KM Berikutnya", dataWO['kmBerikutnya']),
            _buildDetailRow("Nama Pelanggan", dataWO['namaPelanggan']),
            _buildDetailRow("Kerusakan", dataWO['kerusakan']),
            _buildDetailRow("Jasa Service", dataWO['jasaService']),
            _buildDetailRow("Mekanik", dataWO['mekanik']),
            _buildDetailRow("Sub Total", dataWO['subtotal']),
            _buildDetailRow("Pajak", dataWO['pajak']),
            _buildDetailRow("Metode Pembayaran", dataWO['metodePembayaran']),
            _buildDetailRow("Status Pembayaran", dataWO['statusPembayaran']),

            const SizedBox(height: 24),

            // Tombol Edit dan Delete
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Arahkan ke halaman EditWO
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => EditWO(dataWO: dataWO),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(206, 84, 44, 9),
                  ),
                  child: Text(
                    "EDIT",
                    style: GoogleFonts.poppins(color: Colors.white),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Konfirmasi penghapusan
                    _showDeleteConfirmation(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                  ),
                  child: Text(
                    "DELETE",
                    style: GoogleFonts.poppins(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget untuk menampilkan detail data
  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              "$label:",
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              value,
              style: GoogleFonts.poppins(),
            ),
          ),
        ],
      ),
    );
  }

  // Dialog konfirmasi penghapusan
  void _showDeleteConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Konfirmasi Hapus"),
          content: Text("Apakah Anda yakin ingin menghapus WO ini?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("BATAL"),
            ),
            TextButton(
              onPressed: () {
                // Logika penghapusan data
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Data berhasil dihapus")),
                );
                Navigator.pop(context); // Kembali ke halaman sebelumnya
              },
              child: Text("HAPUS", style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}

class EditWO extends StatelessWidget {
  final Map<String, dynamic> dataWO;

  EditWO({required this.dataWO});

  @override
  Widget build(BuildContext context) {
    // Implementasi halaman EditWO dapat disalin dari jawaban sebelumnya
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit WO"),
      ),
      body: Center(
        child: Text("Form Edit WO (Belum diimplementasi lengkap)"),
      ),
    );
  }
}
