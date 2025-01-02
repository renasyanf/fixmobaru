import 'package:flutter/material.dart';
import 'package:fixmobb/Services/model/service.dart';
import 'package:intl/intl.dart';
import 'package:fixmobb/Services/jadwalapi.dart'; 
import 'package:fixmobb/Services/model/jadwal.dart';  // Import Jadwal model

class KeranjangPage extends StatefulWidget {
  final List<Service> selectedServices;
  final List<dynamic> selectedSpareparts;

  const KeranjangPage({
    Key? key,
    required this.selectedServices,
    required this.selectedSpareparts,
  }) : super(key: key);

  @override
  _KeranjangPageState createState() => _KeranjangPageState();
}

class _KeranjangPageState extends State<KeranjangPage> {
  final TextEditingController kendaraanController = TextEditingController();
  final TextEditingController pelangganController = TextEditingController();
  final TextEditingController mekanikController = TextEditingController();
  final TextEditingController dataKerusakanController = TextEditingController();
  String metodePembayaran = 'tunai';
  String bookingDateTime = '';  
  double totalHarga = 0.0;

  @override
  void initState() {
    super.initState();
    totalHarga = widget.selectedServices.fold(0, (sum, service) => sum + service.harga);
  }

  Future<void> _selectBookingDateTime(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      final TimeOfDay? pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          bookingDateTime = DateFormat('yyyy-MM-dd').format(pickedDate) + ' ' + pickedTime.format(context);
        });
      }
    }
  }

  Future<void> bookingSekarang() async {
    if (kendaraanController.text.isEmpty ||
        pelangganController.text.isEmpty ||
        mekanikController.text.isEmpty ||
        dataKerusakanController.text.isEmpty ||
        bookingDateTime.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Mohon lengkapi semua data')),
      );
      return;
    }

    Jadwal jadwal = Jadwal(
      tanggalWaktuBooking: bookingDateTime, 
      kendaraan: kendaraanController.text, 
      pelanggan: pelangganController.text, 
      mekanik: mekanikController.text, 
      dataKerusakan: dataKerusakanController.text, 
      serviceId: widget.selectedServices.first.id,  
      sparepartbrId: widget.selectedSpareparts.isNotEmpty ? widget.selectedSpareparts.first.id : 0,  
      totalBiaya: totalHarga, 
      metodePembayaran: metodePembayaran, 
      status: 'pending',  
    );

    try {
      bool isBookingSuccessful = await JadwalApi.createJadwal(jadwal);

      // Tampilkan pop-up success atau gagal berdasarkan respons dari API
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(isBookingSuccessful ? 'Booking Berhasil' : 'Booking Gagal'),
            content: Text(isBookingSuccessful
                ? 'Booking Anda telah berhasil. Terima kasih!'
                : 'Terjadi kesalahan. Silakan coba lagi nanti.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Booking Gagal'),
            content: Text('Terjadi kesalahan. Silakan coba lagi nanti.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Keranjang')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Layanan yang dipilih:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            ...widget.selectedServices.map((service) {
              return Card(
                elevation: 3,
                margin: EdgeInsets.symmetric(vertical: 8),
                child: ListTile(
                  title: Text(service.nama),
                  subtitle: Text('Rp ${service.harga.toStringAsFixed(0)}'),
                ),
              );
            }).toList(),

            SizedBox(height: 20),
            Row(
              children: [
                Icon(Icons.calendar_today, color: Colors.brown),
                SizedBox(width: 8),
                Text(
                  bookingDateTime.isEmpty 
                    ? 'Pilih Tanggal & Waktu Booking' 
                    : 'Tanggal & Waktu Booking: $bookingDateTime',
                  style: TextStyle(fontSize: 16),
                ),
                Spacer(),
                IconButton(
                  icon: Icon(Icons.access_time, color: Colors.brown),
                  onPressed: () => _selectBookingDateTime(context),
                ),
              ],
            ),

            SizedBox(height: 20),
            TextField(
              controller: kendaraanController,
              decoration: InputDecoration(labelText: 'Kendaraan'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: pelangganController,
              decoration: InputDecoration(labelText: 'Pelanggan'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: mekanikController,
              decoration: InputDecoration(labelText: 'Mekanik'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: dataKerusakanController,
              decoration: InputDecoration(labelText: 'Data Kerusakan'),
            ),
            SizedBox(height: 10),
            DropdownButton<String>(
              value: metodePembayaran,
              items: [
                DropdownMenuItem(
                  value: 'tunai',
                  child: Text('Tunai'),
                ),
                DropdownMenuItem(
                  value: 'transfer',
                  child: Text('Transfer'),
                ),
              ],
              onChanged: (value) {
                setState(() {
                  metodePembayaran = value!;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: bookingSekarang,
              child: Text('Booking Sekarang'),
            ),
          ],
        ),
      ),
    );
  }
}
