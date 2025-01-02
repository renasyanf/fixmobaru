import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fixmobb/screen/customer/sparepart/success.dart';
import 'package:fixmobb/screen/customer/sparepart/payment.dart';

class BookingBaru extends StatefulWidget {
  const BookingBaru({Key? key}) : super(key: key);

  @override
  _BookingBaruState createState() => _BookingBaruState();
}

class _BookingBaruState extends State<BookingBaru> {
  // Variables for date and time selection
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  final List<String> services = [
    'Ban Mobil',
    'Servis Besar',
    'Spooring & Balancin',
    'Velg Ban Mobil',
    'Tune Up',
    'Servis Biasa',
    'Ganti Oli',
    'Cuci Mobil',
    'Lainnya',
  ];

  final Map<String, double> servicePrices = {
    'Ban Mobil': 150000,
    'Servis Besar': 500000,
    'Spooring & Balancin': 200000,
    'Velg Ban Mobil': 300000,
    'Tune Up': 250000,
    'Servis Biasa': 100000,
    'Ganti Oli': 150000,
    'Cuci Mobil': 50000,
    'Lainnya': 0,
  };

  // State to track selected services
  List<bool> selectedServices = List.generate(9, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Bengkel Garage 86 Magetan',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Takeran, \nBengkel Mobil',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 20),

              // Tanggal Kedatangan
              Text(
                'Tanggal Kedatangan',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: selectedDate != null
                      ? '${selectedDate!.day} - ${selectedDate!.month} - ${selectedDate!.year}'
                      : 'Pilih Tanggal',
                  suffixIcon: const Icon(Icons.calendar_today),
                ),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      selectedDate = pickedDate;
                    });
                  }
                },
              ),
              const SizedBox(height: 20),

              // Jam Kedatangan
              Text(
                'Jam Kedatangan',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: selectedTime != null
                      ? '${selectedTime!.hour}:${selectedTime!.minute.toString().padLeft(2, '0')}'
                      : 'Pilih Jam',
                  suffixIcon: const Icon(Icons.access_time),
                ),
                readOnly: true,
                onTap: () async {
                  TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (pickedTime != null) {
                    setState(() {
                      selectedTime = pickedTime;
                    });
                  }
                },
              ),
              const SizedBox(height: 20),

              // Keperluan Booking
              Text(
                'Keperluan Booking',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // 3 items per row
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 2.5, // Adjust box size
                ),
                itemCount: services.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(
                      services[index],
                      style: GoogleFonts.poppins(fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                    value: selectedServices[index],
                    onChanged: (bool? value) {
                      setState(() {
                        selectedServices[index] = value!;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                    dense: true, // Reduces padding
                    contentPadding: EdgeInsets.zero,
                  );
                },
              ),
              const SizedBox(height: 20),

              // Detail Keperluan
              Text(
                'Detail Keperluan',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              TextFormField(
                maxLines: 4,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText:
                      'Masukkan kendala',
                ),
              ),
              const SizedBox(height: 20),

              // Tombol Booking
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // Calculate total payment (totalPembayaran)
                    double totalPembayaran = 0;
                    for (int i = 0; i < selectedServices.length; i++) {
                      if (selectedServices[i]) {
                        totalPembayaran += servicePrices[services[i]]!;
                      }
                    }

                    // Simulasikan data booking
                    final selectedServicesList = services
                        .asMap()
                        .entries
                        .where((entry) => selectedServices[entry.key])
                        .map((entry) => entry.value)
                        .toList();

                    // Navigasi ke halaman sukses booking
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Success(
                          bookingDate: selectedDate!,
                          bookingTime: selectedTime!,
                          selectedServices: selectedServicesList,
                          additionalDetails: '', // Isi sesuai data TextFormField detail
                          totalPembayaran: totalPembayaran, // Pass the total payment
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 77, 48, 6),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Booking',
                    style: TextStyle(fontSize: 16, color: Colors.white),
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
