class Jadwal {
  final String tanggalWaktuBooking;  
  final String kendaraan;            
  final String pelanggan;          
  final String mekanik;            
  final String dataKerusakan;       
  final int serviceId;              
  final int sparepartbrId;           
  final double totalBiaya;           
  final String metodePembayaran;     
  final String status;               

  Jadwal({
    required this.tanggalWaktuBooking,
    required this.kendaraan,
    required this.pelanggan,
    required this.mekanik,
    required this.dataKerusakan,
    required this.serviceId,
    required this.sparepartbrId,  
    required this.totalBiaya,
    required this.metodePembayaran,
    required this.status,
  });

  Map<String, dynamic> toJson() {
    return {
      'tanggal_waktu_booking': tanggalWaktuBooking,  
      'kendaraan': kendaraan,
      'pelanggan': pelanggan,
      'mekanik': mekanik,
      'data_kerusakan': dataKerusakan,  
      'service_id': serviceId,          
      'sparepartbr_id': sparepartbrId,  
      'total_biaya': totalBiaya,      
      'metode_pembayaran': metodePembayaran,  
      'status': status,                
    };
  }
}
