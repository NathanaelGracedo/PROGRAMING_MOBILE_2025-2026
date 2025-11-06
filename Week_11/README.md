# **Laporan Praktikum Codelabs #11**

**Identitas Mahasiswa:**

| Nama | Kelas | Absen |
|------|-------|-----|
| Nathanael Juan Gracedo | TI-3H | 24 |

## Praktikum 1
### Soal 1: Tambahkan nama panggilan Anda pada title app sebagai identitas hasil pekerjaan Anda.

Jawab:
~~~Dart
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nathan Books',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const FuturePage(),
    );
  }
}
~~~

### Soal 2: Carilah judul buku favorit Anda di Google Books, lalu ganti ID buku pada variabel path di kode tersebut. 

![soal2-1](img/Prak1Soal2.png)
![Soal2-2](img/Prak1Soal2b.png)
~~~Dart
  Future<Response> getData() async {
    const authority = 'www.googleapis.com';
    const path = '/books/v1/volumes/NKjNSbEOUKkC';
    Uri url = Uri.https(authority, path);
    return http.get(url);
  }
~~~

### Soal 3: Jelaskan maksud kode langkah 5 tersebut terkait substring dan catchError! Capture hasil praktikum Anda berupa GIF!

Jawab:

**Penjelasan kode langkah 5:**

Kode pada `onPressed` ElevatedButton memiliki beberapa bagian penting:

1. **substring(0, 450)**:
   - Method `substring(0, 450)` digunakan untuk memotong string hasil response dari API
   - Mengambil karakter dari indeks 0 sampai 450 (450 karakter pertama)
   - Tujuannya adalah untuk membatasi jumlah data yang ditampilkan di UI agar tidak terlalu panjang
   - Jika tidak menggunakan substring, seluruh response JSON (yang bisa sangat panjang) akan ditampilkan dan membuat UI tidak rapi

2. **catchError((_){})**:
   - Method `catchError()` digunakan untuk menangani error yang mungkin terjadi saat pemanggilan API
   - Jika terjadi error (misalnya: tidak ada koneksi internet, timeout, URL salah, dll), maka blok kode dalam catchError akan dieksekusi
   - Parameter `(_)` menandakan bahwa kita tidak menggunakan object error yang ditangkap
   - Dalam blok catchError, result diisi dengan pesan "An error occurred" untuk memberi tahu user bahwa terjadi kesalahan
   - `setState(() {})` dipanggil untuk memperbarui UI dan menampilkan pesan error

Output: 

![output1](img/Praktikum1.gif)

## Praktikum 2
### Soal 4: Jelaskan maksud kode langkah 1 dan 2 tersebut! Capture hasil praktikum Anda berupa GIF!

Jawab:

**Penjelasan Langkah 1:**

Pada langkah 1, ditambahkan tiga method async yang mensimulasikan operasi asynchronous:

```dart
Future<int> returnOneAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 1;
}

Future<int> returnTwoAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 2;
}

Future<int> returnThreeAsync() async {
  await Future.delayed(const Duration(seconds: 3));
  return 3;
}
```

**Maksud dan cara kerja:**
- Ketiga method ini bertipe `Future<int>` yang berarti mengembalikan nilai integer secara asynchronous
- Keyword `async` menandakan bahwa method ini berjalan secara asynchronous
- `await Future.delayed(const Duration(seconds: 3))` membuat program menunggu selama 3 detik sebelum melanjutkan eksekusi
- Setelah 3 detik, masing-masing method mengembalikan nilai integer (1, 2, dan 3)
- Method-method ini berguna untuk mensimulasikan operasi yang membutuhkan waktu, seperti pemanggilan API atau pembacaan database

**Penjelasan Langkah 2:**

Pada langkah 2, ditambahkan method `count()` yang menggunakan ketiga method dari langkah 1:

```dart
Future count() async {
  int total = 0;
  total = await returnOneAsync();
  total += await returnTwoAsync();
  total += await returnThreeAsync();
  setState(() {
    result = total.toString();
  });
}
```

**Maksud dan cara kerja:**
- Method `count()` memanggil ketiga method async secara **berurutan (sequential)**
- Inisialisasi variable `total` dengan nilai 0
- `total = await returnOneAsync()`: Menunggu 3 detik, lalu assign nilai 1 ke total
- `total += await returnTwoAsync()`: Menunggu 3 detik lagi, lalu menambahkan 2 ke total (total = 3)
- `total += await returnThreeAsync()`: Menunggu 3 detik lagi, lalu menambahkan 3 ke total (total = 6)
- `setState()`: Memperbarui UI dengan hasil akhir total (6) dalam bentuk string
- **Total waktu eksekusi**: sekitar 9 detik (3 + 3 + 3) karena ketiga operasi berjalan secara berurutan

**Kesimpulan:**
Kode ini mendemonstrasikan bagaimana async/await bekerja secara sequential. Meskipun ketiga method berjalan secara asynchronous, karena menggunakan `await`, setiap method harus menunggu method sebelumnya selesai. Hasilnya adalah total 1 + 2 + 3 = 6 yang ditampilkan setelah 9 detik.

Output:

![output2](img/Praktikum2.gif)

