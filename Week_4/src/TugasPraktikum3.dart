//Parameter Posisional (Positional Parameters)
void perkenalan(String nama, int umur) {
  print('Halo, nama saya $nama, umur saya $umur tahun.');
}

// Parameter Bernama (Named Parameters)
void cetakInfo({String? nama, int? umur}) {
  print('Nama: ${nama ?? 'Tidak diketahui'}, Umur: ${umur ?? 0}');
}

// Parameter Bernama Wajib (Required Named Parameters)
void buatProfil({required String nama, required int umur}) {
  print('Profil dibuat untuk $nama ($umur tahun).');
}

// Parameter Opsional (Optional Parameters)
// 'perangkat' adalah parameter posisional opsional.
void login(String username, String password, [String? perangkat]) {
  var infoPerangkat = perangkat ?? 'Web';
  print('$username login dari $infoPerangkat.');
}

void main(List<String> args) {
  // perkenalan('Nathan', 21); 

  // cetakInfo(umur: 99, nama: 'Juan');
  // cetakInfo(nama: 'Nael');
  // cetakInfo(); // Boleh tidak diisi

  // buatProfil(nama: 'Nathanael', umur: 345);
  // buatProfil(nama: 'Nathanael'); // Ini akan error karena 'umur' wajib diisi.

  login('Gracedo', '123'); // 'perangkat' tidak diisi, akan menggunakan nilai default null.
  login('Gracedo', '123', 'Mobile'); // 'perangkat' diisi.
}