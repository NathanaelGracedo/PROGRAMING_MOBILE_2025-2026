# **Laporan Praktikum Codelabs #12**

**Identitas Mahasiswa:**

| Nama | Kelas | Absen |
|------|-------|-----|
| Nathanael Juan Gracedo | TI-3H | 24 |

## Praktikum 1
### Soal 1: Tambahkan nama panggilan Anda pada title app sebagai identitas hasil pekerjaan Anda. Gantilah warna tema aplikasi sesuai kesukaan Anda.

~~~Dart
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream - Nathan',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const StreamHomePage(),
    );
  }
~~~

### Soal 2: Tambahkan 5 warna lainnya sesuai keinginan Anda pada variabel colors tersebut.

~~~Dart
import 'package:flutter/material.dart';

class ColorStream {
  final List<Color> colors = [
    Colors.blueGrey,
    Colors.amber,
    Colors.deepPurple,
    Colors.lightBlue,
    Colors.lightBlue,
    Colors.teal,
    Colors.red,
    Colors.yellowAccent,
    Colors.pinkAccent,
    Colors.indigoAccent,
    Colors.lime
  ];
}
~~~

### Soal 3: Jelaskan fungsi keyword yield* pada kode tersebut! Apa maksud isi perintah kode tersebut?

~~~Dart
  Stream<Color> getColors() async* {
    yield* Stream.periodic(const Duration(seconds: 1), (int t) {
      int index = t % colors.length;
      return colors[index];
    });
  }
~~~

**Jawaban:**

**Fungsi `yield*`**: Digunakan untuk mendelegasikan (meneruskan) semua nilai dari stream lain ke stream yang sedang dibuat.

**Maksud kode**:
- `async*` → Membuat fungsi generator yang menghasilkan Stream
- `yield*` → Meneruskan semua nilai dari `Stream.periodic` ke stream `getColors()`
- `Stream.periodic` → Membuat stream yang emit nilai setiap 1 detik
- `(int t)` → Parameter t adalah counter yang bertambah setiap emit (0, 1, 2, 3, ...)
- `t % colors.length` → Mengambil index warna secara berulang (0-10, lalu kembali ke 0)
- **Hasil**: Stream yang emit warna berbeda setiap 1 detik secara infinite loop

### Soal 4: Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

![output1](img/Praktikum1.gif)

### Soal 5: Jelaskan perbedaan menggunakan listen dan await for (langkah 9) !

**Jawaban:**

**`await for` (Langkah 9)**:
- Bersifat **blocking** - method akan menunggu dan tidak bisa menjalankan kode lain
- Menggunakan loop untuk memproses setiap event secara sequential
- Sulit untuk di-cancel atau di-pause
- Cocok untuk operasi yang harus menunggu setiap event selesai diproses

**`.listen()` (Langkah 13)**:
- Bersifat **non-blocking** - method langsung selesai, event diproses via callback
- Menggunakan callback yang dipanggil setiap kali ada event baru
- Lebih fleksibel - bisa di-pause, resume, atau cancel via `StreamSubscription`
- Cocok untuk Flutter UI karena tidak menghalangi rendering

**Kesimpulan**: Untuk aplikasi Flutter, `.listen()` lebih disarankan karena tidak blocking UI thread dan memberikan kontrol lebih baik terhadap subscription.
