import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditWO extends StatefulWidget {
  final Map<String, dynamic> dataPelanggan; // Data pelanggan yang akan diedit

  EditWO({required this.dataPelanggan});

  @override
  _EditWOState createState() => _EditWOState();
}

class _EditWOState extends State<EditWO> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController namaController;
  late TextEditingController noWAController;
  late TextEditingController emailController;
  String? status;

  @override
  void initState() {
    super.initState();
    namaController = TextEditingController(text: widget.dataPelanggan['nama']);
    noWAController = TextEditingController(text: widget.dataPelanggan['noWA']);
    emailController = TextEditingController(text: widget.dataPelanggan['email']);
    status = widget.dataPelanggan['status'];
  }

  @override
  void dispose() {
    // Hapus controller setelah digunakan
    namaController.dispose();
    noWAController.dispose();
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(206, 236, 236, 236),
        title: Text(
          "Form Edit Pelanggan",
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
                Text(
                  "FORM EDIT PELANGGAN",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: namaController,
                  decoration: InputDecoration(
                    labelText: 'Nama',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
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
                    return null;
                  },
                ),
                const SizedBox(height: 8),
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
                DropdownButtonFormField<String>(
                  value: status,
                  onChanged: (value) {
                    setState(() {
                      status = value;
                    });
                  },
                  items: ['Aktif', 'Tidak Aktif']
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          ))
                      .toList(),
                  decoration: InputDecoration(
                    labelText: 'Status',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Status harus dipilih';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Proses simpan data edit pelanggan
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Data berhasil diupdate')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(206, 84, 44, 9),
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                    ),
                    child: Text(
                      'UPDATE',
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
