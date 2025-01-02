import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fixmobb/Services/model/sparepart.dart';

class SparepartApi {
  static const String baseUrl = 'http://10.0.2.2:8000/api';

  static Future<List<Sparepart>> fetchSpareparts({String search = ''}) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/spareparts?search=$search'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        return jsonData.map((item) => Sparepart.fromJson(item)).toList();
      } else {
        throw Exception('Failed to load spare parts');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
