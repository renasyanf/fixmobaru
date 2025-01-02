import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailBook extends StatefulWidget {
  @override
  _DetailBookState createState() => _DetailBookState();
}

class _DetailBookState extends State<DetailBook> {
  bool isVerified = false;  // To track whether the button has been verified

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Detail Pesanan',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DetailItem(
              title: 'Nomer PKB',
              content: 'PKB20241111132249000085',
            ),
            SizedBox(height: 10),
            DetailItem(
              title: 'Nomor Polisi',
              content: 'AE 1707 RS',
            ),
            SizedBox(height: 10),
            DetailItem(
              title: 'Mobil',
              content: 'Jazz',
            ),
            SizedBox(height: 10),
            DetailItem(
              title: 'Part',
              content: '- FUCHS TITAN 5W-30 BENSIN (4)\n'
                  '- CHAMBER (1)\n'
                  '- OIL FILTER LANCER (1)\n'
                  '- BRAKE CLEANER (1)',
            ),
            SizedBox(height: 10),
            DetailItem(
              title: 'Mekanik',
              content: 'ABEL',
            ),
            SizedBox(height: 20),
            Center(
              child: Text(
                'TD Sparepart',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isVerified
                      ? Colors.green  // Change to green once verified
                      : const Color.fromARGB(255, 176, 181, 176),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  if (!isVerified) {
                    // Show confirmation dialog
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Konfirmasi'),
                          content: Text('Apakah Anda yakin akan memverifikasi?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop(); // Close the dialog
                              },
                              child: Text('TIDAK'),
                            ),
                            TextButton(
                              onPressed: () {
                                // Handle the verification action here
                                setState(() {
                                  isVerified = true;  // Update button color to green
                                });
                                Navigator.of(context).pop(); // Close the dialog
                                
                                // Navigate to Booking page (adjust according to your routes)
                                Navigator.pushReplacementNamed(context, '/booking');
                              },
                              child: Text('YA'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: Text(
                  'VERIFIKASI',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailItem extends StatelessWidget {
  final String title;
  final String content;

  DetailItem({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.black,
            ),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(
            content,
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }
}
