import 'dart:convert'; // For jsonDecode
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'loginscreen.dart'; // Import halaman Login
import 'package:fixmobb/pages/Services/auth_services.dart';

class Registerscreen extends StatefulWidget {
  @override
  _RegisterscreenState createState() => _RegisterscreenState();
}

class _RegisterscreenState extends State<Registerscreen> {
  bool showPassword = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  
  // Method untuk menangani registrasi
  Future<void> _handleRegister() async {
    // Check if password and confirm password match
    if (_passwordController.text.trim() != _confirmPasswordController.text.trim()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Passwords do not match!')),
      );
      return;
    }

    try {
      // Call the registration method from AuthServices
      final response = await AuthServices.register(
        _emailController.text.trim(),
        _passwordController.text.trim(),
        'defaultUsername', // Replace with the actual value for the third argument
      );

      if (response.statusCode == 200) {
        // Registration successful, navigate to the login screen or dashboard
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Registration successful!')),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Loginscreen()),
        );
      } else {
        // If registration fails, show error message
        final errorMessage = json.decode(response.body)['message'] ?? 'Registration failed';
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(errorMessage)),
        );
      }
    } catch (error) {
      print('Registration Error: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Registration failed: $error')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Get the height of the screen for responsive design
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Color.fromARGB(206, 84, 44, 9), // Warna latar belakang
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Bagian Gambar Atas
              SizedBox(height: screenHeight * 0.1), // Adjust height dynamically
              Container(
                width: 315,
                height: 280,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/onboard2.png'), // Gambar
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              // Bagian Formulir
              Container(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                decoration: BoxDecoration(
                  color: Color(0xFFF6F6F6),
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(27),
                  ),
                ),
                child: Column(
                  children: [
                    // Logo
                    Container(
                      width: 100,
                      height: 65,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/logofixmob.png'), // Logo
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    // Teks Welcome
                    Text(
                      'Create New Account',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w700,
                        fontSize: screenHeight * 0.025, // Responsive font size
                        color: Color.fromARGB(206, 84, 44, 9),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.03),
                    // Input Email
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Email',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: screenHeight * 0.017,
                          color: Color(0xFF8B8B8B),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color.fromARGB(192, 79, 55, 29)),
                        borderRadius: BorderRadius.circular(27.5),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                          border: InputBorder.none,
                          hintText: 'Enter Email',
                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    // Input Password
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Password',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: screenHeight * 0.017,
                          color: Color(0xFF8B8B8B),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color.fromARGB(206, 84, 44, 9)),
                        borderRadius: BorderRadius.circular(27.5),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        controller: _passwordController,
                        obscureText: !showPassword,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                          border: InputBorder.none,
                          hintText: 'Enter Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              showPassword ? Icons.visibility : Icons.visibility_off,
                              color: Color.fromARGB(206, 84, 44, 9),
                            ),
                            onPressed: () {
                              setState(() {
                                showPassword = !showPassword;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    // Input Konfirmasi Password
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Confirm Password',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: screenHeight * 0.017,
                          color: Color(0xFF8B8B8B),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Color.fromARGB(206, 84, 44, 9)),
                        borderRadius: BorderRadius.circular(27.5),
                        color: Colors.white,
                      ),
                      child: TextFormField(
                        controller: _confirmPasswordController,
                        obscureText: !showPassword,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                          border: InputBorder.none,
                          hintText: 'Confirm Password',
                          suffixIcon: IconButton(
                            icon: Icon(
                              showPassword ? Icons.visibility : Icons.visibility_off,
                              color: Color.fromARGB(206, 84, 44, 9),
                            ),
                            onPressed: () {
                              setState(() {
                                showPassword = !showPassword;
                              });
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    // Tampilkan Password
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
                          'Show Password',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: screenHeight * 0.013,
                            color: Color(0xFF2F2F2F),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    // Tombol Register
                    GestureDetector(
                      onTap: _handleRegister, // Call register method
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(206, 84, 44, 9),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 15),
                          child: Text(
                            'Register',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: screenHeight * 0.017,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    // Tautan untuk Login
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Already have an account? ',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: screenHeight * 0.017,
                            color: Color(0xFF2F2F2F),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Loginscreen(), // Navigasi ke halaman login
                              ),
                            );
                          },
                          child: Text(
                            'Login Here',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: screenHeight * 0.017,
                              color: Color.fromARGB(206, 84, 44, 9),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: screenHeight * 0.05), // Space at the bottom
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
