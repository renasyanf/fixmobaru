import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TambahWO extends StatefulWidget {
  @override
  _TambahWOState createState() => _TambahWOState();
}

class _TambahWOState extends State<TambahWO> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController tanggalController = TextEditingController();
  TextEditingController kmSekarangController = TextEditingController();
  TextEditingController kmBerikutnyaController = TextEditingController();
  TextEditingController namaPelangganController = TextEditingController();
  TextEditingController kerusakanController = TextEditingController();
  TextEditingController subtotalController = TextEditingController();
  TextEditingController pajakController = TextEditingController();
  TextEditingController metodePembayaranController = TextEditingController();

  String? kendaraan, jasaService, mekanik, statusPembayaran;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(206, 236, 236, 236),
        title: Text(
          "Form Tambah WO",
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
                // FORM TAMBAH PENJUALAN
                Text("FORM TAMBAH PENJUALAN", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                TextFormField(
                  controller: tanggalController,
                  decoration: InputDecoration(
                    labelText: 'Tanggal',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Tanggal tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: kendaraan,
                  onChanged: (value) {
                    setState(() {
                      kendaraan = value;
                    });
                  },
                  items: ['Kendaraan 1', 'Kendaraan 2', 'Kendaraan 3']
                      .map((item) => DropdownMenuItem<String>(value: item, child: Text(item)))
                      .toList(),
                  decoration: InputDecoration(
                    labelText: 'Pilih Kendaraan',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Pilih kendaraan';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: kmSekarangController,
                  decoration: InputDecoration(
                    labelText: 'KM Sekarang',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'KM Sekarang tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: kmBerikutnyaController,
                  decoration: InputDecoration(
                    labelText: 'KM Berikutnya',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'KM Berikutnya tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                
                // FORM PELANGGAN
                Text("PELANGGAN", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                TextFormField(
                  controller: namaPelangganController,
                  decoration: InputDecoration(
                    labelText: 'Nama Pelanggan',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Nama pelanggan tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                
                // FORM JASA SERVICE
                Text("JASA SERVICE", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: jasaService,
                  onChanged: (value) {
                    setState(() {
                      jasaService = value;
                    });
                  },
                  items: ['Jasa Service 1', 'Jasa Service 2', 'Jasa Service 3']
                      .map((item) => DropdownMenuItem<String>(value: item, child: Text(item)))
                      .toList(),
                  decoration: InputDecoration(
                    labelText: 'Nama Jasa Service',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Pilih jasa service';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                
                // FORM DATA KERUSAKAN
                Text("DATA KERUSAKAN", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                TextFormField(
                  controller: kerusakanController,
                  decoration: InputDecoration(
                    labelText: 'Kerusakan',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Data kerusakan tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                
                // FORM MEKANIK
                Text("MEKANIK", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: mekanik,
                  onChanged: (value) {
                    setState(() {
                      mekanik = value;
                    });
                  },
                  items: ['Mekanik 1', 'Mekanik 2', 'Mekanik 3']
                      .map((item) => DropdownMenuItem<String>(value: item, child: Text(item)))
                      .toList(),
                  decoration: InputDecoration(
                    labelText: 'Pilih Mekanik',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Pilih mekanik';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                
                // FORM ESTIMASI BIAYA
                Text("ESTIMASI BIAYA", style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 8),
                TextFormField(
                  controller: subtotalController,
                  decoration: InputDecoration(
                    labelText: 'Sub Total',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Sub total tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: pajakController,
                  decoration: InputDecoration(
                    labelText: 'Pajak',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Pajak tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: metodePembayaranController,
                  decoration: InputDecoration(
                    labelText: 'Metode Pembayaran',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Metode pembayaran tidak boleh kosong';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<String>(
                  value: statusPembayaran,
                  onChanged: (value) {
                    setState(() {
                      statusPembayaran = value;
                    });
                  },
                  items: ['Lunas', 'Belum Lunas']
                      .map((item) => DropdownMenuItem<String>(value: item, child: Text(item)))
                      .toList(),
                  decoration: InputDecoration(
                    labelText: 'Status Pembayaran',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null) {
                      return 'Pilih status pembayaran';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),
                
                // SIMPAN BUTTON
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Handle form submission
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Data berhasil disimpan')));
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
