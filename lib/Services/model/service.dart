class Service {
  final int id;
  final String nama;
  final String kategori;
  final num harga; // Menggunakan 'num' agar bisa menerima int atau double
  final int durasiPengerjaan;

  Service({
    required this.id,
    required this.nama,
    required this.kategori,
    required this.harga,
    required this.durasiPengerjaan,
  });

  factory Service.fromJson(Map<String, dynamic> json) {
    // Pastikan harga dan durasi_pengerjaan diubah ke tipe yang tepat
    return Service(
      id: json['id'],
      nama: json['nama'],
      kategori: json['kategori'],
      harga: json['harga'] is String ? double.parse(json['harga']) : json['harga'], // Convert harga ke double jika string
      durasiPengerjaan: json['durasi_pengerjaan'] is String 
          ? int.parse(json['durasi_pengerjaan']) 
          : json['durasi_pengerjaan'], // Convert durasi_pengerjaan ke int jika string
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nama': nama,
      'kategori': kategori,
      'harga': harga,
      'durasi_pengerjaan': durasiPengerjaan,
    };
  }
}
