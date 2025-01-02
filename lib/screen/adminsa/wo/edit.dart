import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditWO extends StatefulWidget {
  final Map<String, dynamic> dataWO; // Data WO yang akan diedit

  EditWO({required this.dataWO});

  @override
  _EditWOState createState() => _EditWOState();
}

class _EditWOState extends State<EditWO> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController tanggalController;
  late TextEditingController kmSekarangController;
  late TextEditingController kmBerikutnyaController;
  late TextEditingController namaPelangganController;
  late TextEditingController kerusakanController;
  late TextEditingController subtotalController;
  late TextEditingController pajakController;
  late TextEditingController metodePembayaranController;

  String? kendaraan, jasaService, mekanik, statusPembayaran;

  @override
  void initState() {
    super.initState();
    tanggalController = TextEditingController(text: widget.dataWO['tanggal']);
    kmSekarangController =
        TextEditingController(text: widget.dataWO['kmSekarang']);
    kmBerikutnyaController =
        TextEditingController(text: widget.dataWO['kmBerikutnya']);
    namaPelangganController =
        TextEditingController(text: widget.dataWO['namaPelanggan']);
    kerusakanController =
        TextEditingController(text: widget.dataWO['kerusakan']);
    subtotalController =
        TextEditingController(text: widget.dataWO['subtotal']);
    pajakController = TextEditingController(text: widget.dataWO['pajak']);
    metodePembayaranController =
        TextEditingController(text: widget.dataWO['metodePembayaran']);
    kendaraan = widget.dataWO['kendaraan'];
    jasaService = widget.dataWO['jasaService'];
    mekanik = widget.dataWO['mekanik'];
    statusPembayaran = widget.dataWO['statusPembayaran'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(206, 236, 236, 236),
        title: Text(
          "Form Edit WO",
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
                // FORM EDIT PENJUALAN
                Text("FORM EDIT PENJUALAN",
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.bold)),
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
                      .map((item) => DropdownMenuItem<String>(
                            value: item,
                            child: Text(item),
                          ))
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
                // ... Tambahkan semua field lainnya serupa dengan ini
                const SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Proses simpan data edit WO
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Data berhasil diupdate')));
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
