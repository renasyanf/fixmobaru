import 'package:flutter/material.dart';
import 'package:fixmobb/Services/model/jadwal.dart'; // Import model Jadwal

class RiwayatBookingPage extends StatelessWidget {
  final Jadwal jadwal;

  const RiwayatBookingPage({
    Key? key,
    required this.jadwal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Booking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Detail Booking',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 3,
              child: ListTile(
                title: Text('Tanggal & Waktu Booking'),
                subtitle: Text(jadwal.tanggalWaktuBooking),
              ),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 3,
              child: ListTile(
                title: Text('Kendaraan'),
                subtitle: Text(jadwal.kendaraan),
              ),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 3,
              child: ListTile(
                title: Text('Pelanggan'),
                subtitle: Text(jadwal.pelanggan),
              ),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 3,
              child: ListTile(
                title: Text('Mekanik'),
                subtitle: Text(jadwal.mekanik),
              ),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 3,
              child: ListTile(
                title: Text('Data Kerusakan'),
                subtitle: Text(jadwal.dataKerusakan),
              ),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 3,
              child: ListTile(
                title: Text('Metode Pembayaran'),
                subtitle: Text(jadwal.metodePembayaran),
              ),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 3,
              child: ListTile(
                title: Text('Total Biaya'),
                subtitle: Text('Rp ${jadwal.totalBiaya.toStringAsFixed(0)}'),
              ),
            ),
            SizedBox(height: 10),
            Card(
              elevation: 3,
              child: ListTile(
                title: Text('Status'),
                subtitle: Text(jadwal.status),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Aksi lain setelah melihat riwayat
                Navigator.pop(context);
              },
              child: Text('Kembali ke Keranjang'),
            ),
          ],
        ),
      ),
    );
  }
}
