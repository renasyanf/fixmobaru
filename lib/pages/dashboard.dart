import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fixmobb/pages/service/jenis.dart';
import 'package:fixmobb/pages/service/oli.dart';
import 'package:fixmobb/pages/sparepart/search.dart';
import 'package:fixmobb/pages/profil.dart';
import 'package:fixmobb/pages/roomchat.dart'; 
import 'package:fixmobb/pages/aktivitas/aktivitas.dart'; 
import 'package:fixmobb/pages/widgets/navbar.dart'; 

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });

    // Handle navigation based on the selected index
    switch (index) {
      case 0:
        // Navigate to Home or Dashboard Page
        break; // Handle navigation for home if needed
      case 1:
        // Navigate to Promo Page
        break; // Handle navigation for promo if needed
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AktivitasPage()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => RoomChatPage()),
        );
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dashboard"),
        backgroundColor: Color.fromARGB(206, 84, 44, 9),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                // Navigate to profile page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePages()),
                );
              },
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/profil.png'),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting Text
              Text(
                'Hi Sahabat FixMob,',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Mau service apa hari ini?',
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 20),

              // Dropdown for Branch Selection
              DropdownButtonFormField<String>(
                hint: Text(
                  'Pilih Cabang',
                  style: TextStyle(color: Color.fromARGB(206, 255, 255, 255)),
                ),
                items: [
                  DropdownMenuItem(
                    child: Text("Cabang Madiun"),
                    value: "Cabang 1",
                  ),
                  DropdownMenuItem(
                    child: Text("Cabang Magetan"),
                    value: "Cabang 2",
                  ),
                  DropdownMenuItem(
                    child: Text("Cabang Ponorogo"),
                    value: "Cabang 3",
                  ),
                ],
                onChanged: (String? newValue) {},
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(206, 84, 44, 9),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Color.fromARGB(206, 84, 44, 9)),
                  ),
                ),
              ),
              SizedBox(height: 20),

              // Search Bar
              TextField(
                decoration: InputDecoration(
                  hintText: 'Cari Layanan',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Service(),
                        ),
                      );
                    },
                    child: ServiceCard(
                      title: 'Halo Service',
                      imagePath: 'assets/images/service.png',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SparepartPage(),
                        ),
                      );
                    },
                    child: ServiceCard(
                      title: 'Halo Sparepart',
                      imagePath: 'assets/images/sparepart.png',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),

              // Recommended Services Title
              Text(
                'Rekomendasi Service',
                style: GoogleFonts.poppins(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 5),

              // Recommended Services
              GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  RecommendedServiceCard(title: 'Service Rutin', imagePath: 'assets/images/rutin.png'),
                  RecommendedServiceCard(title: 'Tune-Up Mesin', imagePath: 'assets/images/tuneup.png'),
                  RecommendedServiceCard(title: 'Service Ban', imagePath: 'assets/images/ban.png'),
                  RecommendedServiceCard(title: 'Pemeriksaan AC', imagePath: 'assets/images/ac.png'),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

// Service Card Widget
class ServiceCard extends StatelessWidget {
  final String title;
  final String imagePath;

  const ServiceCard({Key? key, required this.title, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.4,
      padding: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: LinearGradient(
          colors: [
            Color.fromARGB(206, 84, 44, 9),
            Color.fromARGB(206, 153, 101, 55),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            imagePath,
            height: 60,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// Recommended Service Card Widget
class RecommendedServiceCard extends StatelessWidget {
  final String title;
  final String imagePath;

  const RecommendedServiceCard({Key? key, required this.title, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
              child: Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
