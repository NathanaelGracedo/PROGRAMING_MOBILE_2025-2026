void main() {
  var angka = [1, 2, 3, 4];
  // (item) { ... } adalah fungsi tanpa nama.
  angka.forEach((item) {
    print('Angka: $item');
  });

  // Contoh lain dengan sintaks panah (=>) yang lebih ringkas
  var kuadrat = angka.map((item) => item * item);
  print('Hasil kuadrat: $kuadrat'); 
}