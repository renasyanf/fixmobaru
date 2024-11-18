import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vector_math/vector_math_64.dart' as vmath;
import 'package:fixmobb/pages/onboard3.dart';

class Onboard2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(38, 148, 33, 47),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // "SMOOTH" Positioned at top
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'YOUR CAR',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                            color: Color(0xFF581717),
                          ),
                        ),
                      ),
                      // "YOUR CAR" Text
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'OUR PRIORITY',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                            color: Color(0xFF581717),
                          ),
                        ),
                      ),
                      // Description Text
                     
                      // Onboard Image
                      Container(
                        margin: EdgeInsets.only(bottom: 30),
                        child: Image.asset(
                          'assets/images/onboard2.png', // Ensure this image is correctly placed in your assets
                          width: 394,
                          height: 363,
                          fit: BoxFit.cover,
                        ),
                      ),

                       Container(
                        margin: EdgeInsets.only(bottom: 40),
                        child: Text(
                          'Experience The Best Car Service At Your Fingertips. Ensure Your Vehicle Is In Top Shape With Our Expert Mechanics.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                      // Dots and Next Button Row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Dots
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/vectors/ellipse_92_x2.svg', // Ensure this SVG exists in your assets
                                width: 12,
                                height: 11,
                              ),
                              SizedBox(width: 5),
                              SvgPicture.asset(
                                'assets/vectors/ellipse_82_x2.svg', // Ensure this SVG exists in your assets
                                width: 12,
                                height: 11,
                              ),
                              SizedBox(width: 5),
                              SvgPicture.asset(
                                'assets/vectors/ellipse_103_x2.svg', // Ensure this SVG exists in your assets
                                width: 12,
                                height: 11,
                              ),
                            ],
                          ),
                          // NEXT button
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Onboard3()),
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color.fromARGB(206, 84, 44, 9),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
                              child: Center(
                                child: Text(
                                  'NEXT',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
