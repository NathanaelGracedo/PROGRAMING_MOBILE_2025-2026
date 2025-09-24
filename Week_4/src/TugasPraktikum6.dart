// Fungsi ini mendemonstrasikan Lexical Closure
Function buatSalam(String salam) {
  String namaPanggilan = "Tuan";

  // Ini adalah closure (fungsi anonim yang dikembalikan).
  // Dia "mengingat" variabel 'salam' dan 'namaPanggilan' dari scope 'buatSalam'.
  return (String nama) {
    // Di sini, 'salam' dan 'namaPanggilan' diakses karena Lexical Scope.
    print('$salam, $namaPanggilan $nama!');
  };
}

void main() {
  // 'salamPagi' sekarang adalah sebuah closure.
  // Dia masih memiliki akses ke variabel 'salam' ("Selamat Pagi")
  // meskipun fungsi 'buatSalam' sudah selesai dieksekusi.
  var salamPagi = buatSalam("Selamat Berjuang");

  // Memanggil closure tersebut.
  salamPagi("Nathanael"); // Output: Selamat Pagi, Sobat Budi!
}