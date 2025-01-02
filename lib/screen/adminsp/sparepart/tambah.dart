import 'package:flutter/material.dart';

class TambahSparepart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Tambah Sparepart',
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildTextField(label: 'Nama'),
              const SizedBox(height: 10),
              _buildTextField(label: 'Kategori'),
              const SizedBox(height: 10),
              _buildTextField(label: 'Satuan'),
              const SizedBox(height: 10),
              _buildTextField(label: 'Rak'),
              const SizedBox(height: 10),
              _buildTextField(label: 'Kotak'),
              const SizedBox(height: 10),
              _buildTextField(label: 'Harga Beli', keyboardType: TextInputType.number),
              const SizedBox(height: 10),
              _buildTextField(label: 'Harga Jual', keyboardType: TextInputType.number),
              const SizedBox(height: 10),
              _buildTextField(label: 'Jumlah', keyboardType: TextInputType.number),
              const SizedBox(height: 10),
              _buildTextField(label: 'Diskon', keyboardType: TextInputType.number),
              const SizedBox(height: 10),
              _buildTextField(label: 'Total', keyboardType: TextInputType.number),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Aksi saat tombol SIMPAN ditekan
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(206, 84, 44, 9),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'SIMPAN',
                  style: TextStyle(fontSize: 16, color: Colors.white,),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({required String label, TextInputType? keyboardType}) {
    return TextField(
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
    );
  }
}
