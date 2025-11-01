# **Laporan Praktikum Codelab #9**

**Identitas Mahasiswa:**

| Nama | Kelas | Absen |
|------|-------|-----|
| Nathanael Juan Gracedo | TI-3H | 24 |

## Praktikum 1
Output:

![praktikum1](img/Praktikum1.gif)

## Praktikum 2
Output:

![praktikum2](img/Praktikum2.gif)

## Tugas
Output: 

![Tugas](img//tugas.gif)

3. Jelaskan maksud void async pada praktikum 1?

Jawab:

`Future<void> main() async` artinya fungsi main() mengembalikan tipe `Future<void>` dan bersifat asynchronous. Keyword `async` diperlukan karena di dalam fungsi main() kita menggunakan `await` untuk menunggu hasil dari `availableCameras()` yang merupakan operasi asynchronous (butuh waktu untuk mengakses hardware kamera). Tanpa `async`, kita tidak bisa menggunakan `await`, dan tanpa `await`, aplikasi bisa crash karena mencoba mengakses kamera yang belum siap. Jadi, `async-await` memastikan bahwa kamera sudah tersedia sebelum aplikasi dijalankan.

4. Jelaskan fungsi dari anotasi @immutable dan @override ?

Jawab:

**`@immutable`**: Anotasi ini menandakan bahwa sebuah class bersifat immutable (tidak dapat diubah). Semua field/properti di dalam class tersebut harus final. Ini penting di Flutter karena widget yang immutable lebih efisien dan mudah di-rebuild tanpa efek samping. Contohnya pada `FilterItem` dan `PhotoFilterCarousel`, semua propertinya final sehingga state-nya tidak berubah setelah dibuat.

 **`@override`**: Anotasi ini menandakan bahwa sebuah method sedang meng-override (menimpa) method dari parent class atau interface. Ini membantu developer mengetahui bahwa method tersebut adalah implementasi dari method yang sudah ada di superclass. Contohnya `@override Widget build()` berarti kita sedang mengimplementasikan ulang method `build()` dari class `StatelessWidget` atau `State`. Jika ada typo pada nama method, compiler akan memberi warning karena tidak ada method yang di-override.
