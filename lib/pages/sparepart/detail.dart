import 'package:flutter/material.dart';
import 'package:fixmobb/pages/sparepart/search.dart';
import 'package:fixmobb/booking.dart'; // Pastikan file booking.dart berisi BookingServicePage

class ProductPage extends StatefulWidget {
  final String title; // Parameter judul produk
  final String price; // Parameter harga produk
  final String imagePath; // Parameter gambar produk

  ProductPage({
    required this.title,
    required this.price,
    required this.imagePath,
  });

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int quantity = 1; // Jumlah barang default

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title), // Menampilkan judul produk
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar produk di bagian atas
            Center(
              child: Image.asset(
                widget.imagePath, // Menampilkan gambar produk
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            // Harga produk
            Text(
              widget.price, // Menampilkan harga produk
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            // Informasi tambahan mengenai cicilan
            Text(
              'Rp. 133.333 x 3 Bulan dengan cicilan',
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(height: 8),
            // Deskripsi produk
            Text(
              'OLI MOBIL SHELL HELIX ULTRA 5W - 30 | POUR MOTEURS DIESEL ET ESSENCE | ECT 30',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 4),
            // Rating dan jumlah produk yang terjual
            Row(
              children: [
                Text(
                  '4.8',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 4),
                Icon(Icons.star, color: Colors.orange, size: 16),
                SizedBox(width: 4),
                Text('134 Terjual'),
              ],
            ),
            SizedBox(height: 16),
            // Gambar tambahan oli di atas tombol tambah-kurangi
            Center(
              child: Image.asset(
                'assets/images/oli_21.jpeg', // Gambar oli tambahan
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            // Tombol untuk mengurangi atau menambah jumlah barang
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: () {
                      setState(() {
                        if (quantity > 1) quantity--; // Mengurangi jumlah
                      });
                    },
                  ),
                  Text(
                    '$quantity', // Menampilkan jumlah barang
                    style: TextStyle(fontSize: 18),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: () {
                      setState(() {
                        quantity++; // Menambah jumlah
                      });
                    },
                  ),
                ],
              ),
            ),
            Spacer(),
            // Tombol "LANJUT" untuk melakukan booking
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown,
                  padding: EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                ),
                onPressed: () {
                  _showBookingDialog(context); // Memunculkan dialog untuk booking
                },
                child: Text(
                  'LANJUT',
                  style: TextStyle(color: Colors.white), // Warna teks putih
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Dialog untuk konfirmasi booking
  void _showBookingDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Apakah Anda ingin melanjutkan dengan booking waktu?'),
          actions: [
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: Text('TIDAK'),
            ),
            TextButton(
              style: TextButton.styleFrom(backgroundColor: Colors.green),
              onPressed: () {
                // Navigasi ke halaman BookingServicePage
                Navigator.of(context).pop(); // Tutup dialog
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookingServicePage(), // Halaman BookingServicePage
                  ),
                );
              },
              child: Text('YA'),
            ),
          ],
        );
      },
    );
  }
}
