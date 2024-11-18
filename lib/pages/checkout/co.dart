import 'package:flutter/material.dart';

class CheckoutPage extends StatefulWidget {
  final DateTime selectedDate;  // Accept selectedDate
  final TimeOfDay selectedTime; // Accept selectedTime

  CheckoutPage({required this.selectedDate, required this.selectedTime});

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Checkout",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Display selected date and time
            Text(
              "Pemesanan untuk Tanggal: ${widget.selectedDate}",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Pemesanan pada Waktu: ${widget.selectedTime.format(context)}",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),

            // Sparepart Section
            Text(
              "Sparepart",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Image.network(
                  'https://example.com/sparepart.jpg', // URL gambar sparepart
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "OLI MOBIL SHELL HELIX ULTRA 5W - 30 | POUR MOTEURS DIESEL ET ESSENCE | ECT 30",
                        style: TextStyle(fontSize: 14),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Rp 275.000",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Text(
                  "x1",
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            SizedBox(height: 16),

            // Service Section
            Text(
              "Service",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Image.network(
                  'assets/images/oli_7.jpeg', // URL gambar service
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ganti Oli",
                        style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        "Penggantian oli mesin yang diperlukan untuk menjaga pelumasan komponen mesin agar tetap bekerja lancar.",
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.timer, size: 16),
                          SizedBox(width: 4),
                          Text("60 mnt"),
                          SizedBox(width: 16),
                          Text("Rp 75.000"),
                        ],
                      ),
                    ],
                  ),
                ),
                Text(
                  "x1",
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
            // Remaining parts of the code unchanged
          ],
        ),
      ),
    );
  }
}
