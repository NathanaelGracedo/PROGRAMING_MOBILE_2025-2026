(int, int) tukar((int, int) record) {
  var (a, b) = record;
  return (b, a);
}

void main(List<String> args) {
  var record = ('first', 'last', a: 2, b: true);
  print('Record awal (string, bool, dll): $record\n');

  var numbers = (10, 20);
  print('Record numbers sebelum ditukar: $numbers');

  var hasilTukar = tukar(numbers);
  print('Record numbers setelah ditukar: $hasilTukar');

  (String, int) mahasiswa = ('Nathanael Juan Gracedo', 2341720217);
  print(mahasiswa);

  var mahasiswa2 = ('Nathanael Juan Gracedo', '2341720217', a: 2, b: true);

  print(mahasiswa2.$1); // Prints 'Nathanael Juan Gracedo'
  print(mahasiswa2.a); // Prints 2
  print(mahasiswa2.b); // Prints true
  print(mahasiswa2.$2); // Prints '2341720217'
}
