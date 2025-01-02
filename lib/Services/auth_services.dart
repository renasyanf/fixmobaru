import 'dart:convert';
import 'package:fixmobb/Services/globals.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  // Fungsi untuk registrasi
  static Future<http.Response> register(
    String name, String email, String password, String phone) async {
    Map data = {
      "name": name,
      "email": email,
      "password": password,
      "phone": phone,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'auth/register');
    http.Response response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);
    return response;
  }

  // Fungsi untuk login
  static Future<http.Response> login(String email, String password) async {
    Map data = {
      "email": email,
      "password": password,
    };
    var body = json.encode(data);
    var url = Uri.parse(baseURL + 'auth/login');

    try {
      http.Response response = await http.post(
        url,
        headers: headers,
        body: body,
      );
      print(response.body);

      // Memeriksa jika status kode adalah 200 (berhasil)
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        // Memeriksa apakah 'user' ada dalam data respons
        if (responseData.containsKey('user')) {
          final String name = responseData['user']['name'];
          final String email = responseData['user']['email'];
          final String phone = responseData['user']['phone'];

          // Menyimpan data pengguna ke SharedPreferences
          final SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('name', name);
          prefs.setString('email', email);
          prefs.setString('phone', phone);

          // Mengembalikan respons yang berhasil
          return response;
        } else {
          print('Data pengguna tidak ditemukan dalam respons.');
          throw Exception('Data pengguna hilang dalam respons.');
        }
      } else {
        print('Login gagal dengan status kode: ${response.statusCode}');
        return response;
      }
    } catch (error) {
      print('Terjadi kesalahan saat login: $error');
      rethrow; // Melempar ulang error untuk ditangani di lapisan UI
    }
  }
}
