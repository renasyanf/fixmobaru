import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fixmobb/pages/sparepart/detail.dart';

class SparepartPage extends StatefulWidget {
  @override
  _SparepartPageState createState() => _SparepartPageState();
}

class _SparepartPageState extends State<SparepartPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Sparepart",
          style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {
              // Handle notification action
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search bar
              TextField(
                decoration: InputDecoration(
                  hintText: "Oli",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 16),

              // Promo banner
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFF6C3A10),
                  borderRadius: BorderRadius.circular(10),
                ),
                height: 100,
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/oli_7.jpeg',
                      height: 50,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Pilih Sparepart Andalanmu!",
                            style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600, color: Colors.white),
                          ),
                          SizedBox(height: 4),
                          Text(
                            "Bebas pilih sparepart sesuai keinginanmu dan bisa langsung booking.",
                            style: GoogleFonts.poppins(fontSize: 12, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),

              // Search result text
              Text(
                'Hasil pencarian untuk "Oli"',
                style: GoogleFonts.poppins(fontSize: 14, color: Colors.grey.shade600),
              ),
              SizedBox(height: 16),

              // TabBar
              TabBar(
                controller: _tabController,
                indicatorColor: Color(0xFF6C3A10),
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: "Terkait"),
                  Tab(text: "Terbaru"),
                  Tab(text: "Terlaris"),
                ],
              ),
              SizedBox(height: 16),

              // GridView for spareparts
              Container(
                height: 400,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildGridView(),
                    _buildGridView(),
                    _buildGridView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridView() {
    final List<Map<String, dynamic>> spareparts = [
      {'title': 'Oli Shell Helix Ultra 5W - 30', 'price': 'Rp. 376.000', 'imagePath': 'assets/images/oli_21.jpeg'},
      {'title': 'Oli Mobil 1 5W - 30', 'price': 'Rp. 376.000', 'imagePath': 'assets/images/oli_21.jpeg'},
      {'title': 'Oli Castrol Edge 5W - 30', 'price': 'Rp. 376.000', 'imagePath': 'assets/images/oli_31.jpeg'},
      {'title': 'Oli Top 1 Evolution 5W - 30', 'price': 'Rp. 376.000', 'imagePath': 'assets/images/oli_7.jpeg'},
      // Add more spareparts here
    ];

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.7,
      ),
      itemCount: spareparts.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Navigate to detail page on tap
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductPage(
                  title: spareparts[index]['title'],
                  price: spareparts[index]['price'],
                  imagePath: spareparts[index]['imagePath'],
                ),
              ),
            );
          },
          child: _sparepartCard(
            spareparts[index]['title'],
            spareparts[index]['price'],
            spareparts[index]['imagePath'],
          ),
        );
      },
    );
  }

  Widget _sparepartCard(String title, String price, String imagePath) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              height: 80,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 8),
            Text(
              title,
              style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: 4),
            Text(
              price,
              style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.red),
            ),
            SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.star, size: 14, color: Colors.amber),
                SizedBox(width: 4),
                Text(
                  "4.8 (134 terjual)",
                  style: GoogleFonts.poppins(fontSize: 10, color: Colors.grey.shade600),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Sparepart detail page
class SparepartDetailPage extends StatelessWidget {
  final String title;
  final String price;
  final String imagePath;

  SparepartDetailPage({required this.title, required this.price, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          title,
          style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              imagePath,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            SizedBox(height: 16),
            Text(
              title,
              style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8),
            Text(
              price,
              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.red),
            ),
            SizedBox(height: 16),
            Text(
              "Deskripsi sparepart:",
              style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 8),
            Text(
              "Sparepart ini sangat cocok untuk kendaraan anda dengan kualitas terbaik dan harga yang terjangkau.",
              style: GoogleFonts.poppins(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
