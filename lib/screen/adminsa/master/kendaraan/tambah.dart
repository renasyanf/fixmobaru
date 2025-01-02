import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TambahKendaraan extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text(
          "TAMBAH KENDARAAN",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              // Input Nama Pemilik
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Nama Pemilik",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nama pemilik tidak boleh kosong";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              // Input Tipe Kendaraan
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Tipe Kendaraan",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Tipe kendaraan tidak boleh kosong";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              // Input Model Kendaraan
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Model Kendaraan",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Model kendaraan tidak boleh kosong";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              // Input Tahun Pembuatan
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Tahun Pembuatan",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Tahun pembuatan tidak boleh kosong";
                  }
                  if (int.tryParse(value) == null) {
                    return "Tahun harus berupa angka";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              // Input Silinder
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Silinder (cc)",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Silinder tidak boleh kosong";
                  }
                  if (int.tryParse(value) == null) {
                    return "Silinder harus berupa angka";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              // Input Warna Kendaraan
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Warna Kendaraan",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Warna kendaraan tidak boleh kosong";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              // Input Nomor Rangka
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Nomor Rangka",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nomor rangka tidak boleh kosong";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              // Input Nomor Mesin
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Nomor Mesin",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Nomor mesin tidak boleh kosong";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),

              // Dropdown Jenis Bahan Bakar
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: "Jenis Bahan Bakar",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                items: const [
                  DropdownMenuItem(value: "Solar", child: Text("Solar")),
                  DropdownMenuItem(value: "Bensin", child: Text("Bensin")),
                ],
                onChanged: (value) {
                  // Aksi saat dropdown berubah
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Jenis bahan bakar harus dipilih";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Tombol Simpan
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Aksi untuk menyimpan data
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Data kendaraan berhasil disimpan")),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(206, 84, 44, 9),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  "SIMPAN",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
