
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

