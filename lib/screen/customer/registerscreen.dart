import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'loginscreen.dart';
import 'package:fixmobb/Services/auth_services.dart'; // Pastikan AuthServices menangani API call
import 'package:shared_preferences/shared_preferences.dart';

class Registerscreen extends StatefulWidget {
  @override
  _RegisterscreenState createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {
  bool showPassword = false;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  // Fungsi untuk menangani proses registrasi
  Future<void> _handleRegister() async {
    if (_passwordController.text.trim() != _confirmPasswordController.text.trim()) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password dan Konfirmasi Password tidak cocok!')));
      return;
    }

    if (_emailController.text.isEmpty || _phoneController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Email atau Nomor Telepon tidak boleh kosong!')));
      return;
    }

    if (_passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Password tidak boleh kosong!')));
      return;
    }

    try {
      final response = await AuthServices.register(
        _nameController.text.trim(),
        _emailController.text.trim(),
        _passwordController.text.trim(),
        _phoneController.text.trim(),
      );

      if (response.statusCode == 200) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('name', _nameController.text.trim());
        prefs.setString('email', _emailController.text.trim());
        prefs.setString('phone', _phoneController.text.trim());

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registrasi berhasil!')));
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Loginscreen()));
      } else {
        final errorMessage = json.decode(response.body)['message'] ?? 'Registrasi gagal';
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(errorMessage)));
      }
    } catch (error) {
      print('Kesalahan Registrasi: $error');
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registrasi gagal: $error')));
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: Color.fromARGB(206, 84, 44, 9)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.1),
              Container(
                width: 315,
                height: 280,
                decoration: BoxDecoration(
                  image: DecorationImage(fit: BoxFit.cover, image: AssetImage('assets/images/onboard2.png')),
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                decoration: BoxDecoration(color: Color(0xFFF6F6F6), borderRadius: BorderRadius.vertical(top: Radius.circular(27))),
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 65,
                      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.cover, image: AssetImage('assets/images/logofixmob.png'))),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Buat Akun Baru',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w700, fontSize: screenHeight * 0.025, color: Color.fromARGB(206, 84, 44, 9)),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    _buildInputField('Nama Lengkap', 'Masukkan Nama Lengkap', _nameController, TextInputType.text),
                    _buildInputField('Email', 'Masukkan Email', _emailController, TextInputType.emailAddress),
                    _buildInputField('Nomor Telepon', 'Masukkan Nomor Telepon', _phoneController, TextInputType.phone),
                    _buildPasswordInputField('Password', 'Masukkan Password', _passwordController),
                    _buildPasswordInputField('Konfirmasi Password', 'Ulangi Password', _confirmPasswordController),
                    Row(
                      children: [
                        Checkbox(
                          value: showPassword,
                          onChanged: (bool? value) {
                            setState(() {
                              showPassword = value!;
                            });
                          },
                        ),
                        Text(
                          'Tampilkan Password',
                          style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: screenHeight * 0.013, color: Color(0xFF2F2F2F)),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    GestureDetector(
                      onTap: _handleRegister,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(color: Color.fromARGB(206, 84, 44, 9), borderRadius: BorderRadius.circular(18)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Text('Daftar', textAlign: TextAlign.center, style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: screenHeight * 0.017, color: Colors.white)),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Sudah punya akun? ', style: GoogleFonts.poppins(fontWeight: FontWeight.w400, fontSize: screenHeight * 0.017, color: Color(0xFF2F2F2F))),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => Loginscreen()));
                          },
                          child: Text('Login di sini', style: GoogleFonts.poppins(fontWeight: FontWeight.w600, fontSize: screenHeight * 0.017, color: Color.fromARGB(206, 84, 44, 9))),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.05),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputField(String label, String hint, TextEditingController controller, TextInputType inputType) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: GoogleFonts.poppins(fontWeight: FontWeight.w500, fontSize: 16, color: Color(0xFF8B8B8B))),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(192, 79, 55, 29)),
            borderRadius: BorderRadius.circular(27.5),
            color: Colors.white,
          ),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15), border: InputBorder.none, hintText: hint),
            keyboardType: inputType,
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildPasswordInputField(String label, String hint, TextEditingController controller) {
    return _buildInputField(label, hint, controller, TextInputType.text);
  }
}
