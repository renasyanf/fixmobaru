import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fixmobb/Services/model/jadwal.dart';

class JadwalApi {
  static const String baseUrl = 'http://10.0.2.2:8000/api/jadwals'; 

  // Fungsi untuk membuat jadwal baru
  static Future<bool> createJadwal(Jadwal jadwal) async {
    final url = Uri.parse('$baseUrl/jadwal'); 

    try {
      // Membuat data JSON dari objek jadwal
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'tanggal_waktu_booking': jadwal.tanggalWaktuBooking,
          'kendaraan': jadwal.kendaraan,
          'pelanggan': jadwal.pelanggan,
          'mekanik': jadwal.mekanik,
          'data_kerusakan': jadwal.dataKerusakan,
          'service_id': jadwal.serviceId,
          'sparepartbr_id': jadwal.sparepartbrId,
          'total_biaya': jadwal.totalBiaya,
          'metode_pembayaran': jadwal.metodePembayaran,
          'status': jadwal.status,
        }),
      );

      if (response.statusCode == 200) {
        // Jika berhasil, return true
        return true;
      } else {
        // Jika gagal, return false
        return false;
      }
    } catch (e) {
      print('Error: $e');
      return false;
    }
  }
}
