import 'package:flutter/material.dart';

class EditSparepart extends StatelessWidget {
  final Map<String, String> sparepart;

  const EditSparepart({required this.sparepart, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final namaController = TextEditingController(text: sparepart['nama']);
    final kategoriController = TextEditingController(text: sparepart['kategori']);
    final satuanController = TextEditingController(text: sparepart['satuan']);
    final rakController = TextEditingController(text: sparepart['rak'] ?? '');
    final kotakController = TextEditingController(text: sparepart['kotak'] ?? '');
    final hargaBeliController = TextEditingController(text: sparepart['hargaBeli'] ?? '');
    final hargaJualController = TextEditingController(text: sparepart['hargaJual'] ?? '');
    final jumlahController = TextEditingController(text: sparepart['jumlah']);
    final diskonController = TextEditingController(text: sparepart['diskon'] ?? '');
    final totalController = TextEditingController(text: sparepart['total'] ?? '');

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Edit Sparepart',
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
              _buildTextField(label: 'Nama', controller: namaController),
              const SizedBox(height: 10),
              _buildTextField(label: 'Kategori', controller: kategoriController),
              const SizedBox(height: 10),
              _buildTextField(label: 'Satuan', controller: satuanController),
              const SizedBox(height: 10),
              _buildTextField(label: 'Rak', controller: rakController),
              const SizedBox(height: 10),
              _buildTextField(label: 'Kotak', controller: kotakController),
              const SizedBox(height: 10),
              _buildTextField(
                label: 'Harga Beli',
                controller: hargaBeliController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              _buildTextField(
                label: 'Harga Jual',
                controller: hargaJualController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              _buildTextField(
                label: 'Jumlah',
                controller: jumlahController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              _buildTextField(
                label: 'Diskon',
                controller: diskonController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 10),
              _buildTextField(
                label: 'Total',
                controller: totalController,
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Aksi untuk menyimpan data sparepart yang telah diedit
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(206, 84, 44, 9),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: const Text(
                  'SIMPAN',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    TextInputType? keyboardType,
  }) {
    return TextField(
      controller: controller,
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
