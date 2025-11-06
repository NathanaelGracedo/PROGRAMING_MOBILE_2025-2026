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