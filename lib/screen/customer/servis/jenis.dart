import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fixmobb/Services/serviceapi.dart';
import 'package:fixmobb/Services/model/service.dart';
import 'package:fixmobb/screen/customer/servis/detail.dart';
import 'package:fixmobb/screen/customer/chart.dart';

class ServicePage extends StatefulWidget {
  @override
  _ServicePageState createState() => _ServicePageState();
}

class _ServicePageState extends State<ServicePage> {
  late Future<List<Service>> services;
  TextEditingController searchController = TextEditingController();
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    fetchServiceList();
  }

  void fetchServiceList() {
    services = ServiceApi.fetchServices(search: searchQuery);
  }

  void onSearch(String query) {
    setState(() {
      searchQuery = query;
      fetchServiceList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Text(
          'Daftar Layanan',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            color: const Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.shopping_cart, color: Colors.brown[800]),
            onPressed: () {
               Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Keranjang())
               );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              controller: searchController,
              onChanged: onSearch,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.brown[100],
                hintText: 'Cari layanan...',
                hintStyle: TextStyle(color: Colors.brown[700]),
                prefixIcon: Icon(Icons.search, color: Colors.brown[600]),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Service>>(
              future: services,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return Center(child: Text('Tidak ada data yang sesuai.'));
                }

                final data = snapshot.data!;
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    final service = data[index];
                    return Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 8, horizontal: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 5,
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailServicePage(service: service),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              // Icon or image for the service
                              Container(
                                height: 60,
                                width: 60,
                                decoration: BoxDecoration(
                                  color: Colors.brown[200],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Icon(
                                  Icons.build,
                                  color: Colors.brown[700],
                                  size: 30,
                                ),
                              ),
                              SizedBox(width: 16),
                              // Service details
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      service.nama,
                                      style: GoogleFonts.poppins(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.brown[800],
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Kategori: ${service.kategori}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        color: Colors.brown[600],
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      'Harga: Rp ${service.harga.toStringAsFixed(0)}',
                                      style: GoogleFonts.poppins(
                                        fontSize: 14,
                                        color: Colors.brown[600],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Duration
                              Column(
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    color: Colors.brown[600],
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    '${service.durasiPengerjaan} menit',
                                    style: GoogleFonts.poppins(
                                      fontSize: 12,
                                      color: Colors.brown[600],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
