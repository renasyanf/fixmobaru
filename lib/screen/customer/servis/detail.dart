import 'package:flutter/material.dart';
import 'package:fixmobb/Services/model/service.dart';
import 'package:fixmobb/screen/customer/keranjang.dart';

class DetailServicePage extends StatelessWidget {
  final Service service;

  const DetailServicePage({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detail Layanan',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Placeholder untuk gambar layanan
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    'https://via.placeholder.com/400x200?text=${service.nama}',
                    fit: BoxFit.cover,
                    height: 200,
                    width: double.infinity,
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Detail layanan dalam kartu
              Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        service.nama,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                        ),
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.category, color: Colors.brown),
                          SizedBox(width: 8),
                          Text(
                            "Kategori: ${service.kategori}",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.price_check, color: Colors.green),
                          SizedBox(width: 8),
                          Text(
                            "Harga: Rp ${service.harga.toStringAsFixed(0)}",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(Icons.timer, color: Colors.blue),
                          SizedBox(width: 8),
                          Text(
                            "Durasi Pengerjaan: ${service.durasiPengerjaan} menit",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              // Tombol aksi
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // Menambahkan layanan yang dipilih ke keranjang
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => KeranjangPage(
                            selectedServices: [service], // Kirim layanan yang dipilih
                            selectedSpareparts: [],
                          ),
                        ),
                      );
                    },
                    icon: Icon(Icons.shopping_cart),
                    label: Text('Masukkan Keranjang'), // Ganti teks di sini
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 254, 254, 254),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                  OutlinedButton.icon(
                    onPressed: () {
                      // Tambahkan aksi lainnya di sini
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Hubungi layanan pelanggan'),
                        ),
                      );
                    },
                    icon: Icon(Icons.support_agent),
                    label: Text('Hubungi Kami'),
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.brown),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
