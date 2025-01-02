import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fixmobb/screen/adminsa/wo/wo.dart'; 
import 'package:fixmobb/screen/adminsa/fixation/fixation.dart';
import 'package:fixmobb/screen/adminsa/master/sparepart.dart';
import 'package:fixmobb/screen/adminsa/master/pelanggan/pelanggan.dart';
import 'package:fixmobb/screen/adminsa/master/kendaraan/kendaraan.dart';
import 'package:fixmobb/screen/adminsa/master/mekanik/mekanik.dart';

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(206, 84, 44, 9),
            ),
            child: Text(
              'Menu',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.build),
            title: Text('Pendaftaran Service', style: GoogleFonts.poppins(fontSize: 16)),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Workoder()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.inventory),
            title: Text('Booking', style: GoogleFonts.poppins(fontSize: 16)),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: Text('Fixation', style: GoogleFonts.poppins(fontSize: 16)),
            onTap: () {
              Navigator.pop(context); 
               Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Fixation()),
              );
            },
          ),

          ExpansionTile(
            leading: const Icon(Icons.settings),
            title: Text('Data Master', style: GoogleFonts.poppins(fontSize: 16)),
            children: [
              ListTile(
                leading: const Icon(Icons.car_repair),
                title: Text('Sparepart', style: GoogleFonts.poppins(fontSize: 14)),
                onTap: () {
                  Navigator.pop(context); 
                  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SparepartPage()),
              );
                },
              ),
              ListTile(
                leading: const Icon(Icons.person),
                title: Text('Pelanggan', style: GoogleFonts.poppins(fontSize: 14)),
                onTap: () {
                  Navigator.pop(context); 
                   Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Pelanggan()),
              );
                },
              ),
              ListTile(
                leading: const Icon(Icons.directions_car),
                title: Text('Kendaraan', style: GoogleFonts.poppins(fontSize: 14)),
                onTap: () {
                  Navigator.pop(context);
                   Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Kendaraan()),
              ); 
                },
              ),
              ListTile(
                leading: const Icon(Icons.group),
                title: Text('Mekanik', style: GoogleFonts.poppins(fontSize: 14)),
                onTap: () {
                  Navigator.pop(context); 
                  Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Mekanik()),
              ); 
                },
              ),
              ListTile(
                leading: const Icon(Icons.build),
                title: Text('Service', style: GoogleFonts.poppins(fontSize: 14)),
                onTap: () {
                  Navigator.pop(context); 
                },
              ),
              ListTile(
                leading: const Icon(Icons.person_add),
                title: Text('Data User', style: GoogleFonts.poppins(fontSize: 14)),
                onTap: () {
                  Navigator.pop(context); 
                },
              ),
              ListTile(
                leading: const Icon(Icons.location_city),
                title: Text('Data Cabang', style: GoogleFonts.poppins(fontSize: 14)),
                onTap: () {
                  Navigator.pop(context); 
                },
              ),
            ],
          ),

          ExpansionTile(
            leading: const Icon(Icons.attach_money),
            title: Text('Laporan Keuangan', style: GoogleFonts.poppins(fontSize: 16)),
            children: [
              ListTile(
                leading: const Icon(Icons.account_balance_wallet),
                title: Text('Piutang', style: GoogleFonts.poppins(fontSize: 14)),
                onTap: () {
                  Navigator.pop(context); 
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
