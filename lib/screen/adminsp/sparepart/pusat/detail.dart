import 'package:flutter/material.dart';
import 'package:fixmobb/screen/adminsp/sparepart/pusat/edit.dart';

class DetailSparepartPage extends StatelessWidget {
  final Map<String, String> sparepart;

  const DetailSparepartPage({required this.sparepart, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Detail Sparepart',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close, color: Colors.red),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow(label: 'Nama', value: sparepart['nama'] ?? '-'),
            const SizedBox(height: 10),
            _buildDetailRow(label: 'Kategori', value: sparepart['kategori'] ?? '-'),
            const SizedBox(height: 10),
            _buildDetailRow(label: 'Satuan', value: sparepart['satuan'] ?? '-'),
            const SizedBox(height: 10),
            _buildDetailRow(label: 'Rak', value: sparepart['rak'] ?? '-'),
            const SizedBox(height: 10),
            _buildDetailRow(label: 'Kotak', value: sparepart['kotak'] ?? '-'),
            const SizedBox(height: 10),
            _buildDetailRow(label: 'Harga Beli', value: sparepart['hargaBeli'] ?? '-'),
            const SizedBox(height: 10),
            _buildDetailRow(label: 'Harga Jual', value: sparepart['hargaJual'] ?? '-'),
            const SizedBox(height: 10),
            _buildDetailRow(label: 'Jumlah', value: sparepart['jumlah'] ?? '-'),
            const SizedBox(height: 10),
            _buildDetailRow(label: 'Diskon', value: sparepart['diskon'] ?? '-'),
            const SizedBox(height: 10),
            _buildDetailRow(label: 'Total', value: sparepart['total'] ?? '-'),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditSparepart(sparepart: sparepart),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(206, 84, 44, 9),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      'EDIT',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _showDeleteConfirmation(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      'DELETE',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow({required String label, required String value}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label: ',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Expanded(
          child: Text(
            value,
            style: const TextStyle(color: Colors.black87),
          ),
        ),
      ],
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
                Navigator.pop(context); 
                Navigator.pop(context); 
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
