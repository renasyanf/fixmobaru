import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';  // Ensure this import is added
import 'package:fixmobb/screen/customer/start.dart';

class Onboard3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
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
                      // Positioned "TRUSTED REPAIR" Text at the top
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'TRUSTED REPAIR',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            fontSize: 25,
                            color: Color(0xFF581717),
                          ),
                        ),
                      ),
                      // "EVERYTIME" Heading
                      Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Text(
                          'EVERYTIME',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 25,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      // Onboard Image
                      Container(
                        margin: EdgeInsets.only(bottom: 30),
                        child: Image.asset(
                          'assets/images/onboard3.png',  // Ensure the image is placed correctly in your assets
                          width: 275,
                          height: 279,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Description Text
                      Container(
                        margin: EdgeInsets.only(bottom: 40),
                        child: Text(
                          'Experience the best car service at your fingertips. Ensure your vehicle is in top shape with our expert mechanics.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w400,
                            fontSize: 13,
                            color: Colors.black,
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
                                'assets/vectors/ellipse_93_x2.svg',  // Ensure these SVGs exist in your assets
                                width: 12,
                                height: 11,
                              ),
                              SizedBox(width: 5),
                              SvgPicture.asset(
                                'assets/vectors/ellipse_101_x2.svg',  // Ensure these SVGs exist in your assets
                                width: 12,
                                height: 11,
                              ),
                              SizedBox(width: 5),
                              SvgPicture.asset(
                                'assets/vectors/ellipse_83_x2.svg',  // Ensure these SVGs exist in your assets
                                width: 12,
                                height: 11,
                              ),
                            ],
                          ),
                          // Next Button
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Start()),
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
