import 'package:flutter/material.dart';

class Voucher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Text(
          'Pilih Voucher',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Aksi kembali
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            color: Colors.grey[200],
            child: Text(
              'Voucher yang Tersedia',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 8),
              itemCount: 20, // Jumlah voucher yang banyak
              itemBuilder: (context, index) {
                return _voucherItem(index); // Pass index as parameter
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _voucherItem(int index) { // Accept index as a parameter
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              color: Color.fromARGB(50, 84, 44, 9), // Warna coklat muda
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Icon(
                Icons.card_giftcard,
                color: Color.fromARGB(206, 84, 44, 9), // Warna coklat tua
                size: 40,
              ),
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Diskon Rp ${50000 + 10000 * index}', // Fix angka tanpa underscore
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Min. pembelian Rp ${200000 + 10000 * index}', // Fix angka tanpa underscore
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
                SizedBox(height: 4),
                Text(
                  'Berlaku hingga ${30 - index % 30} Des 2024',
                  style: TextStyle(color: Colors.grey[500], fontSize: 12),
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Aksi untuk menggunakan voucher
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(206, 84, 44, 9), // Warna coklat
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
            child: Text(
              'Gunakan',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
