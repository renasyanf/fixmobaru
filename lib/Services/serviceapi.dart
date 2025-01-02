import 'dart:convert';
import 'package:http/http.dart' as http;
import 'model/service.dart';

class ServiceApi {
  static const String baseUrl = 'http://10.0.2.2:8000/api';

  static Future<List<Service>> fetchServices({String search = ''}) async {
  try {
    final response = await http.get(
      Uri.parse('$baseUrl/services?search=$search'),
      headers: {'Content-Type': 'application/json'},
    );

    // Cek status code respons
    if (response.statusCode == 200) {
      print("Response Body: ${response.body}"); // Debug response body
      final List<dynamic> jsonData = json.decode(response.body);
      return jsonData.map((item) => Service.fromJson(item)).toList();
    } else {
      // Menambahkan pengecekan status code jika bukan 200
      print("Response Status Code: ${response.statusCode}");
      throw Exception('Failed to load services. Status code: ${response.statusCode}');
    }
  } catch (e) {
    // Menangani kesalahan yang terjadi
    print("Error: $e");
    throw Exception('Error fetching services: $e');
  }
}
}