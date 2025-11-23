
# **Laporan Praktikum Codelabs #13**

**Identitas Mahasiswa:**

| Nama | Kelas | Absen |
|------|-------|-----|
| Nathanael Juan Gracedo | TI-3H | 24 |

## Praktikum 1
### Soal 1: Tambahkan nama panggilan Anda pada title app sebagai identitas hasil pekerjaan Anda. Gantilah warna tema aplikasi sesuai kesukaan Anda.

~~~Dart
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nathan Store Data',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Back End Interaction - Nathan')),
      body: Container(),
    );
  }
}
~~~

### Soal 2: Masukkan hasil capture layar ke laporan praktikum Anda.

![Praktikum1](img/Prak1.png)

### Soal 3: Masukkan hasil capture layar ke laporan praktikum Anda.

![Praktikum1.2](img/Prak1.2.png)

Debug Console:

![Praktikum1-debug-console](img/Prak1-debugConsole.png)

## Praktikum 2
### Soal 4: Capture hasil running aplikasi Anda, kemudian impor ke laporan praktikum Anda!

![Praktikum2](img/Prak2.png)

## Praktikum 3
### Soal 5: Jelaskan maksud kode lebih safe dan maintainable! Capture hasil praktikum Anda dan lampirkan di README.

**Penjelasan Kode Lebih Safe dan Maintainable:**

1. **Safe (Aman):**
   - Menggunakan `int.tryParse()` dan `double.tryParse()` dengan null coalescing operator (`??`) untuk menangani konversi tipe data yang gagal, mencegah runtime error
   - Menggunakan `.toString()` untuk memastikan nilai selalu dikonversi ke String
   - Menangani nilai null dengan memberikan nilai default (0 untuk number, '' untuk String)
   - Aplikasi tidak crash meskipun menerima data JSON yang tidak konsisten atau rusak

2. **Maintainable (Mudah Dipelihara):**
   - Menggunakan konstanta (`keyId`, `keyName`, dll.) menggantikan hardcoded string, menghindari typo
   - Jika nama kunci JSON berubah, hanya perlu update di satu tempat (konstanta)
   - Kode lebih mudah dibaca dan dipahami karena nama konstanta yang deskriptif

~~~Dart
// Konstanta untuk kunci JSON
const keyId = 'id';
const keyName = 'pizzaName';
const keyDescription = 'description';
const keyPrice = 'price';
const keyImage = 'imageUrl';

class Pizza {
  final int id;
  final String pizzaName;
  final String description;
  final double price;
  final String imageUrl;

  // Constructor dengan error handling
  Pizza.fromJson(Map<String, dynamic> json)
      : id = int.tryParse(json[keyId].toString()) ?? 0,
        pizzaName =
            json[keyName] != null ? json[keyName].toString() : 'No name',
        description = (json[keyDescription] != null)
            ? json[keyDescription].toString()
            : '',
        price = double.tryParse(json[keyPrice].toString()) ?? 0,
        imageUrl = json[keyImage] ?? '';

  Map<String, dynamic> toJson() {
    return {
      keyId: id,
      keyName: pizzaName,
      keyDescription: description,
      keyPrice: price,
      keyImage: imageUrl,
    };
  }
}
~~~

## Praktikum 4
### Langkah 1-12

![Praktikum4](img/Prak4.jpg)

### Langkah 13-14 Soal 6: Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

![Praktikum4](img/Prak4.2.gif)

## Praktikum 5
### Soal 7: Capture hasil praktikum Anda dan lampirkan di README.

![Praktikum5](img/Prak5.jpg)

## Praktikum 6
### Soal 8: Jelaskan maksud kode pada langkah 3 dan 7 ! Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

**Penjelasan Langkah 3 - Method writeFile():**

Method `writeFile()` adalah fungsi asinkron yang bertugas menulis data ke file:
- Menggunakan `myFile.writeAsString()` untuk menulis string 'Nathanael Juan Gracedo - 2341720217' ke file
- Wrapped dalam `try-catch` untuk menangani error jika terjadi kegagalan saat menulis file
- Mengembalikan `true` jika berhasil menulis file
- Mengembalikan `false` jika terjadi error

~~~Dart
Future<bool> writeFile() async {
  try {
    await myFile.writeAsString('Nathanael Juan Gracedo - 2341720217');
    return true;
  } catch (e) {
    return false;
  }
}
~~~

**Penjelasan Langkah 7 - Run Aplikasi:**

Ketika aplikasi dijalankan dan tombol "Read File" ditekan:
1. Method `readFile()` dipanggil yang membaca konten file menggunakan `myFile.readAsString()`
2. Konten yang dibaca (hasil dari `writeFile()` sebelumnya) disimpan ke variabel `fileText`
3. UI diperbarui dengan `setState()` sehingga teks yang dibaca dari file ditampilkan di layar
4. Hasilnya adalah teks 'Nathanael Juan Gracedo - 2341720217' akan muncul di layar

![Prak6](img/Prak6.gif)

## Praktikum 7
### Soal 9: Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

![Praktikum7](img/Prak7.gif)