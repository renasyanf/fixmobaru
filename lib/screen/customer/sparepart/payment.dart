import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Payment extends StatefulWidget {
  final double totalPembayaran;

  const Payment({Key? key, required this.totalPembayaran}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  // Track selected payment method
  String? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Halaman Pembayaran',
          style: GoogleFonts.poppins(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 77, 48, 6),
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        iconTheme: const IconThemeData(color: Color.fromARGB(255, 77, 48, 6)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              'Silakan pilih metode pembayaran yang tersedia.',
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),

            // Display Total Payment
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Pembayaran:',
                  style: GoogleFonts.poppins(fontSize: 16),
                ),
                Text(
                  'Rp ${widget.totalPembayaran.toStringAsFixed(2)}', // Format the total payment
                  style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Payment Method - Cicilan
            _buildPaymentMethodTile(
              'Cicilan 3 Bulan',
              'Pembayaran dicicil selama 3 bulan.',
              'cicilan',
              Icons.credit_card,
            ),
            const SizedBox(height: 10),

            // Payment Method - Transfer Bank
            _buildPaymentMethodTile(
              'Transfer Bank',
              'Bank XYZ - No. Rekening: 18191001222901',
              'transfer_bank',
              Icons.account_balance,
            ),
            const SizedBox(height: 10),

            // Payment Method - Transfer E-money
            _buildPaymentMethodTile(
              'Transfer E-money',
              'GoPay, Dana, ShopeePay, OVO ke no: 0895609891914',
              'transfer_emoney',
              Icons.payment,
            ),
            const SizedBox(height: 20),

            // Button to confirm payment
            ElevatedButton(
              onPressed: () {
                if (selectedPaymentMethod != null) {
                  // Simulate payment confirmation
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Pembayaran berhasil!')),
                  );
                } else {
                  // Show an error if no payment method is selected
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Pilih metode pembayaran terlebih dahulu!')),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 77, 48, 6),
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'BAYAR SEKARANG',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Method to build each payment method tile
  Widget _buildPaymentMethodTile(String title, String subtitle, String method, IconData icon) {
    bool isSelected = selectedPaymentMethod == method;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedPaymentMethod = isSelected ? null : method; // Toggle selection
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected
              ? Color.fromARGB(255, 255, 223, 186) // Light brown for selected
              : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected
                ? Color.fromARGB(255, 77, 48, 6) // Dark brown border when selected
                : Colors.grey,
            width: 1.5,
          ),
        ),
        child: ListTile(
          leading: Icon(
            icon,
            color: isSelected ? Color.fromARGB(255, 77, 48, 6) : Colors.grey,
          ),
          title: Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Color.fromARGB(255, 77, 48, 6) : Colors.black,
            ),
          ),
          subtitle: Text(
            subtitle,
            style: GoogleFonts.poppins(fontSize: 12, color: isSelected ? Colors.black : Colors.grey),
          ),
        ),
      ),
    );
  }
}
