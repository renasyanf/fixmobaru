import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fixmobb/Services/model/sparepart.dart';
import 'package:fixmobb/Services/sparepartapi.dart';
import 'package:fixmobb/screen/customer/sparepart/detail.dart';  
import 'package:fixmobb/screen/customer/chart.dart';

class SparepartPage extends StatefulWidget {
  @override
  _SparepartPageState createState() => _SparepartPageState();
}

class _SparepartPageState extends State<SparepartPage> with SingleTickerProviderStateMixin {
  late Future<List<Sparepart>> _spareparts;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _spareparts = SparepartApi.fetchSpareparts();
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
            icon: Icon(Icons.shopping_cart, color: Colors.black),
            onPressed: () {
              Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Keranjang()), // Make sure ChartPage is properly imported
          );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: "Cari Sparepart",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 16),

            // Promotional Banner
            Container(
              padding: EdgeInsets.all(16),
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

            // TabBarView with GridView
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
    );
  }

  Widget _buildGridView() {
    return FutureBuilder<List<Sparepart>>(
      future: _spareparts,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text("Error: ${snapshot.error}"));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text("No spare parts found."));
        } else {
          final spareparts = snapshot.data!;
          return GridView.builder(
            physics: BouncingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 0.8,
            ),
            itemCount: spareparts.length,
            itemBuilder: (context, index) {
              final sparepart = spareparts[index];
              return _sparepartCard(sparepart);
            },
          );
        }
      },
    );
  }

  Widget _sparepartCard(Sparepart sparepart) {
    return GestureDetector(
      onTap: () {
        // Navigate to DetailSparepartPage when a spare part is clicked
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailSparepartPage(sparepart: sparepart),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              (sparepart.gambar != null && sparepart.gambar!.isNotEmpty)
                  ? Image.network(
                      'http://10.0.2.2:8000/storage/${sparepart.gambar}',
                      height: 100,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  : Container(
                      height: 100,
                      color: Colors.grey[200],
                      child: Icon(Icons.image, size: 50, color: Colors.grey),
                    ),
              SizedBox(height: 8),
              Text(
                sparepart.namaSparepart,
                style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: 4),
              Text(
                'Rp. ${sparepart.harga.toStringAsFixed(0)}',
                style: GoogleFonts.poppins(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.red),
              ),
              SizedBox(height: 4),
              Text(
                'Stok: ${sparepart.jumlahStock}',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: sparepart.jumlahStock > 0 ? Colors.black : Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
