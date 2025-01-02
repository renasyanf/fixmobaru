import 'package:flutter/material.dart';
import 'package:fixmobb/Services/model/service.dart';

class BookingPage extends StatelessWidget {
  final Service service;

  const BookingPage({Key? key, required this.service}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Konfirmasi Booking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Service: ${service.nama}', style: TextStyle(fontSize: 16)),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Booking berhasil!')),
                );
              },
              child: Text('Konfirmasi Booking'),
            ),
          ],
        ),
      ),
    );
  }
}
