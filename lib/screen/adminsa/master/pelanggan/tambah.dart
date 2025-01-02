import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TambahPelanggan extends StatefulWidget {
  @override
  _TambahPelangganState createState() => _TambahPelangganState();
}

class _TambahPelangganState extends State<TambahPelanggan> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController namaPelangganController = TextEditingController();
  TextEditingController noWAController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String? statusPelanggan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(206, 236, 236, 236),
        title: Text(
          "Form Tambah Pelanggan",
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
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Form
                Text(
                  "FORM TAMBAH PELANGGAN",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),

                // Nama Pelanggan
                TextFormField(
                  controller: namaPelangganController,
                  decoration: InputDecoration(
                    labelText: 'Nama Pelanggan',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama pelanggan tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),

                // No WA
                TextFormField(
                  controller: noWAController,
                  decoration: InputDecoration(
                    labelText: 'No WA',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nomor WA tidak boleh kosong';
                    }
                    if (!RegExp(r'^\d+$').hasMatch(value)) {
                      return 'Nomor WA hanya boleh berisi angka';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),

                // Email
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email tidak boleh kosong';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Format email tidak valid';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),

                // Status Pelanggan
                DropdownButtonFormField<String>(
                  value: statusPelanggan,
                  onChanged: (value) {
                    setState(() {
                      statusPelanggan = value;
                    });
                  },
                  items: ['Aktif', 'Tidak Aktif']
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          ))
                      .toList(),
                  decoration: InputDecoration(
                    labelText: 'Status Pelanggan',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Status pelanggan harus dipilih';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Tombol Simpan
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Simpan data pelanggan
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Data pelanggan berhasil disimpan'),
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(206, 84, 44, 9),
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                    ),
                    child: Text(
                      'SIMPAN',
                      style: GoogleFonts.poppins(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
