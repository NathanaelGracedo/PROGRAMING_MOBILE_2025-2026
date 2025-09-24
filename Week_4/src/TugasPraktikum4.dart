// 1. Menyimpan fungsi dalam variabel
void sapa(String nama) {
  print('Halo, $nama!');
}

// 2. Memberikan fungsi sebagai argumen ke fungsi lain
// Fungsi 'operasi' adalah parameter
void hitung(int a, int b, Function(int, int) operasi) {
  var hasil = operasi(a, b);
  print('Hasilnya adalah: $hasil');
}

int tambah(int a, int b) {
  return a + b;
}

int kurang(int a, int b) {
  return a - b;
}

// 3. Mengembalikan fungsi dari fungsi lain
Function buatPengali(int pengali) {
  // Ini adalah fungsi yang dikembalikan (anonymous function)
  return (int angka) => angka * pengali;
}

void main() {
  // // Fungsi 'sapa' disimpan dalam variabel 'ucapan'
  // var ucapan = sapa;

  // ucapan('Juan Gracedo'); 

  //  // Memberikan fungsi 'tambah' sebagai argumen
  // hitung(10, 5, tambah); 

  // // Memberikan fungsi 'kurang' sebagai argumen
  // hitung(10, 5, kurang); 

   // 'kaliDua' sekarang adalah sebuah fungsi yang akan mengalikan dengan 2
  var kaliDua = buatPengali(2);

  // 'kaliTiga' adalah fungsi yang akan mengalikan dengan 3
  var kaliTiga = buatPengali(3);

  print(kaliDua(10)); 
  print(kaliTiga(10)); 
}