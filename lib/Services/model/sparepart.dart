class Sparepart {
  final String kodeSparepart;
  final String namaSparepart;
  final int jumlahStock;
  final double harga;
  final String kategori;
  final String? gambar;

  Sparepart({
    required this.kodeSparepart,
    required this.namaSparepart,
    required this.jumlahStock,
    required this.harga,
    required this.kategori,
    this.gambar,
  });

  factory Sparepart.fromJson(Map<String, dynamic> json) {
    return Sparepart(
      kodeSparepart: json['kode_sparepart'],
      namaSparepart: json['nama_sparepart'],
      jumlahStock: json['jumlah_stock'],
      harga: json['harga'] is String ? double.parse(json['harga']) : json['harga'],
      kategori: json['kategori'],
      gambar: json['gambar'],
    );
  }
}
