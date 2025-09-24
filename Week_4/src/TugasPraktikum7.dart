// Fungsi untuk mengembalikan Record (String, int)
(String, int) getUserInfo() {
  String nama = "Nathanael Juan Gracedo";
  int umur = 21;
  return (nama, umur);
}

void main() {
  var infoPengguna = getUserInfo();

  print('Nama: ${infoPengguna.$1}');
  print('Umur: ${infoPengguna.$2}');  
}