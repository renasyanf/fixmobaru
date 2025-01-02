import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fixmobb/screen/customer/onboard2.dart';

class Onboard1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFFFFFFF),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(30, 132, 27, 47),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // "FIXMOB" Text with Bold Font
                      Container(
                        margin: EdgeInsets.only(bottom: 5), 
                        child: Text(
                          'FIXMOB',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,  
                            fontSize: 35,
                            color: Color.fromARGB(206, 84, 44, 9),
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(bottom: 20), 
                        child: Text(
                          'DRIVE WITH CONFIDENT',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Color.fromARGB(206, 84, 44, 9),
                          ),
                        ),
                      ),
                      // Onboard Image
                      Container(
                        margin: EdgeInsets.only(bottom: 10), 
                        child: Image.asset(
                          'assets/images/onboard1.png',  // Ensure this image is correctly placed in your assets
                          width: 377,
                          height: 421,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Text Description
                      Container(
                        margin: EdgeInsets.only(bottom: 20),
                        child: Text(
                          'Welcome to FixMob Professional service. Your trusted partner for all car maintenance needs. Discover expert services designed to keep your vehicle in perfect condition."',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            height: 1.5,
                            color: Color(0xFF000000),
                          ),
                        ),
                      ),
                      // Dots and Next Button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                'assets/vectors/ellipse_81_x2.svg',  // Ensure this SVG exists in your assets
                                width: 12,
                                height: 11,
                              ),
                              SizedBox(width: 5),
                              SvgPicture.asset(
                                'assets/vectors/ellipse_91_x2.svg',  // Ensure this SVG exists in your assets
                                width: 12,
                                height: 11,
                              ),
                              SizedBox(width: 5),
                              SvgPicture.asset(
                                'assets/vectors/ellipse_102_x2.svg',  // Ensure this SVG exists in your assets
                                width: 12,
                                height: 11,
                              ),
                            ],
                          ),
                         
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Onboard2()),
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
