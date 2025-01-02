// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:fixmobb/adminsp/dashboard.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Loginscreen(),
//     );
//   }
// }

// class Loginscreen extends StatefulWidget {
//   @override
//   _LoginscreenState createState() => _LoginscreenState();
// }

// class _LoginscreenState extends State<Loginscreen> {
//   bool _obscurePassword = true;
//   bool _isLoading = false;
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();

//   void _navigateToDashboard() {
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(builder: (context) => Dashboard()),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Container(
//           decoration: BoxDecoration(color: Color.fromARGB(206, 84, 44, 9)),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(height: 80),
//               Container(
//                 width: 315,
//                 height: 280,
//                 decoration: BoxDecoration(
//                   image: DecorationImage(
//                     fit: BoxFit.cover,
//                     image: AssetImage('assets/images/onboard2.png'),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 30),
//               Container(
//                 padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
//                 decoration: BoxDecoration(
//                   color: Color(0xFFF6F6F6),
//                   borderRadius: BorderRadius.vertical(top: Radius.circular(27)),
//                 ),
//                 child: Column(
//                   children: [
//                     Container(
//                       width: 100,
//                       height: 65,
//                       decoration: BoxDecoration(
//                         image: DecorationImage(
//                           fit: BoxFit.cover,
//                           image: AssetImage('assets/images/logofixmob.png'),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 5),
//                     Text(
//                       'Selamat datang di Fixmob',
//                       style: GoogleFonts.poppins(
//                         fontWeight: FontWeight.w700,
//                         fontSize: 20,
//                         color: Color.fromARGB(206, 84, 44, 9),
//                       ),
//                     ),
//                     SizedBox(height: 30),
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         'Email',
//                         style: GoogleFonts.poppins(
//                           fontWeight: FontWeight.w500,
//                           fontSize: 14,
//                           color: Color(0xFF8B8B8B),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Color.fromARGB(192, 79, 55, 29)),
//                         borderRadius: BorderRadius.circular(27.5),
//                         color: Colors.white,
//                       ),
//                       child: TextFormField(
//                         controller: _emailController,
//                         decoration: InputDecoration(
//                           contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//                           border: InputBorder.none,
//                           hintText: 'Masukkan Email',
//                         ),
//                         keyboardType: TextInputType.emailAddress,
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                     Align(
//                       alignment: Alignment.centerLeft,
//                       child: Text(
//                         'Password',
//                         style: GoogleFonts.poppins(
//                           fontWeight: FontWeight.w500,
//                           fontSize: 14,
//                           color: Color(0xFF8B8B8B),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 10),
//                     Container(
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Color(0xFF4F1D1D)),
//                         borderRadius: BorderRadius.circular(27.5),
//                         color: Colors.white,
//                       ),
//                       child: TextFormField(
//                         controller: _passwordController,
//                         obscureText: _obscurePassword,
//                         decoration: InputDecoration(
//                           contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
//                           border: InputBorder.none,
//                           hintText: 'Masukkan Password',
//                           suffixIcon: IconButton(
//                             icon: Icon(
//                               _obscurePassword ? Icons.visibility_off : Icons.visibility,
//                             ),
//                             onPressed: () {
//                               setState(() {
//                                 _obscurePassword = !_obscurePassword;
//                               });
//                             },
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 15),
//                     Row(
//                       children: [
//                         Checkbox(
//                           value: !_obscurePassword,
//                           onChanged: (bool? value) {
//                             setState(() {
//                               _obscurePassword = !value!;
//                             });
//                           },
//                         ),
//                         Text(
//                           'Tampilkan Password',
//                           style: GoogleFonts.poppins(
//                             fontWeight: FontWeight.w400,
//                             fontSize: 13,
//                             color: Color(0xFF2F2F2F),
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 20),
//                     GestureDetector(
//                       onTap: _navigateToDashboard,
//                       child: Container(
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           color: Color.fromARGB(206, 84, 44, 9),
//                           borderRadius: BorderRadius.circular(18),
//                         ),
//                         child: Padding(
//                           padding: EdgeInsets.symmetric(vertical: 15),
//                           child: _isLoading
//                               ? CircularProgressIndicator(color: Colors.white)
//                               : Text(
//                                   'Login',
//                                   textAlign: TextAlign.center,
//                                   style: GoogleFonts.poppins(
//                                     fontWeight: FontWeight.w400,
//                                     fontSize: 15,
//                                     color: Colors.white,
//                                   ),
//                                 ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 20),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
