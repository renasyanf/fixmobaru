import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fixmobb/screen/customer/user/successbook.dart';

class SuccessBooking extends StatelessWidget {
  final DateTime bookingDate;
  final TimeOfDay bookingTime;
  final List<String> selectedServices;
  final String additionalDetails;

  const SuccessBooking({
    Key? key,
    required this.bookingDate,
    required this.bookingTime,
    required this.selectedServices,
    required this.additionalDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Sukses'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Ikon sukses
            Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 100,
            ),
            const SizedBox(height: 16),

            // Pesan sukses
            Text(
              'Booking Anda Berhasil!',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              'Kami akan menunggu kedatangan Anda sesuai jadwal booking.',
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Detail booking
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Detail Booking:',
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Tanggal
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tanggal:', style: GoogleFonts.poppins(fontSize: 14)),
                      Text(
                        '${bookingDate.day}-${bookingDate.month}-${bookingDate.year}',
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),

                  // Jam
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Jam:', style: GoogleFonts.poppins(fontSize: 14)),
                      Text(
                        '${bookingTime.hour}:${bookingTime.minute.toString().padLeft(2, '0')}',
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),

                  // Keperluan
                  Text(
                    'Keperluan:',
                    style: GoogleFonts.poppins(fontSize: 14),
                  ),
                  const SizedBox(height: 5),
                  ...selectedServices.map(
                    (service) => Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(
                        '- $service',
                        style: GoogleFonts.poppins(fontSize: 14),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Detail tambahan
                  Text(
                    'Detail Tambahan:',
                    style: GoogleFonts.poppins(fontSize: 14),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    additionalDetails.isNotEmpty
                        ? additionalDetails
                        : 'Tidak ada detail tambahan.',
                    style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const Spacer(),

            // Tombol kembali ke beranda
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 77, 48, 6),
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              ),
              child: Text(
                'Kembali ke Beranda',
                style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
