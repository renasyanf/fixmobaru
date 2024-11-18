import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fixmobb/pages/loginscreen.dart';
import 'package:fixmobb/pages/registerscreen.dart';

class Start extends StatefulWidget {
  @override
  _StartState createState() => _StartState();
}

class _StartState extends State<Start> {
  bool _isHoveredLogin = false;
  bool _isHoveredSignUp = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 80, 24, 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top-left logo
                Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    'assets/images/logofixmob.png',
                    width: 80,
                    height: 76,
                  ),
                ),
                SizedBox(height: 5), // Space between logo and text

                // Main headline text
                Text(
                  'Fast, Reliable, Affordable',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w800,
                    fontSize: 34,
                    color: Color.fromARGB(206, 84, 44, 9),
                  ),
                ),
                SizedBox(height: 0), // Space between text and buttons

                // Positioned image
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/start.png',
                    width: 338,
                    height: 326,
                  ),
                ),
                SizedBox(height: 0), // Space between image and buttons

                // Login button
                Align(
                  alignment: Alignment.center,
                  child: MouseRegion(
                    onEnter: (_) {
                      setState(() {
                        _isHoveredLogin = true;
                      });
                    },
                    onExit: (_) {
                      setState(() {
                        _isHoveredLogin = false;
                      });
                    },
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Loginscreen(),
                          ),
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: _isHoveredLogin
                                ? Color.fromARGB(206, 50, 26, 5)
                                : Color.fromARGB(206, 84, 44, 9),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        width: 303,
                        padding: EdgeInsets.symmetric(vertical: 13),
                        alignment: Alignment.center,
                        child: Text(
                          'Log in',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20), // Space between login and sign up buttons

                // Sign up button
                Align(
                  alignment: Alignment.center,
                  child: MouseRegion(
                    onEnter: (_) {
                      setState(() {
                        _isHoveredSignUp = true;
                      });
                    },
                    onExit: (_) {
                      setState(() {
                        _isHoveredSignUp = false;
                      });
                    },
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Registerscreen(),
                          ),
                        );
                      },
                      child: Container(
                        width: 303,
                        padding: EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: _isHoveredSignUp
                              ? Colors.grey[200] // Light grey color on hover
                              : Colors.white, // Default color
                          border: Border.all(
                            color: _isHoveredSignUp
                                ? Colors.black // Darker border on hover
                                : Color(0xFF4F1D1D), // Default border color
                          ),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Sign up',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            color: _isHoveredSignUp
                                ? Colors.black // Darker text on hover
                                : Color(0xFF4F1D1D), // Default text color
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 100), // Space between buttons and footer text

                // Footer text
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Copyright@2024 Fixmob 1,o.',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 11,
                      height: 1.1,
                      color: Color(0xFF000000),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
