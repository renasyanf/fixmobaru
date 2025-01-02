import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fixmobb/Services/model/sparepart.dart';

class DetailSparepartPage extends StatelessWidget {
  final Sparepart sparepart;

  DetailSparepartPage({required this.sparepart});

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
          sparepart.namaSparepart,
          style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Display image if available
              (sparepart.gambar != null && sparepart.gambar!.isNotEmpty)
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'http://10.0.2.2:8000/storage/${sparepart.gambar}',
                        height: 300,  // Increased image size to 300px
                        width: double.infinity,
                        fit: BoxFit.contain, // Ensures the image doesn't get cropped
                      ),
                    )
                  : Container(
                      height: 300,
                      color: Colors.grey[200],
                      child: Icon(Icons.image, size: 100, color: Colors.grey),
                    ),
              SizedBox(height: 16),

              // Product Name and Price
              Text(
                sparepart.namaSparepart,
                style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 8),
              Text(
                'Rp. ${sparepart.harga.toStringAsFixed(0)}',
                style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w600, color: Colors.red),
              ),
              SizedBox(height: 16),

              // Stock Status
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: sparepart.jumlahStock > 0 ? Colors.green : Colors.red,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  'Stok: ${sparepart.jumlahStock}',
                  style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 16),

              // Product Category
              Row(
                children: [
                  Icon(Icons.category, size: 20, color: Colors.grey),
                  SizedBox(width: 8),
                  Text(
                    'Kategori: ${sparepart.kategori ?? "Tidak Tersedia"}',
                    style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey[700]),
                  ),
                ],
              ),
              SizedBox(height: 16),

              

              // Button to continue to booking
              ElevatedButton(
                onPressed: () {
                  // Navigate to Booking or related functionality
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF6C3A10),
                  padding: EdgeInsets.symmetric(vertical: 13, horizontal: 24),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Center(
                  child: Text(
                    'BOOK NOW',
                    style: GoogleFonts.poppins(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
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
