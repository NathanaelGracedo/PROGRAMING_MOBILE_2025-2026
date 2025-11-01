# **Laporan Praktikum Codelabs #10**

**Identitas Mahasiswa:**

| Nama | Kelas | Absen |
|------|-------|-----|
| Nathanael Juan Gracedo | TI-3H | 24 |

## Praktikum 1
Output:

![praktikum1](img/Praktikum1.gif)

## Tugas Praktikum 1
2. Jelaskan maksud dari langkah 4 pada praktikum tersebut! Mengapa dilakukan demikian?

**Jawab:**

Langkah 4 membuat file `data_layer.dart` yang berfungsi sebagai **barrel file** (file penampung export). File ini mengumpulkan semua export dari model-model data (`plan.dart` dan `task.dart`) dalam satu tempat.

**Alasan dilakukan:**
- **Menyederhanakan import**: Daripada import setiap file model satu per satu di banyak tempat, kita cukup import `data_layer.dart` saja
- **Maintainability**: Jika nanti ada model baru, kita tinggal tambahkan export di file ini tanpa mengubah semua file yang menggunakan model tersebut
- **Clean code**: Membuat struktur kode lebih rapi dan terorganisir, terutama saat aplikasi berkembang dengan banyak model

**Contoh perbandingan:**
```dart
// Tanpa data_layer.dart (ribet)
import 'package:master_plan/models/plan.dart';
import 'package:master_plan/models/task.dart';

// Dengan data_layer.dart (lebih simpel)
import 'package:master_plan/models/data_layer.dart';
```

Jadi, barrel file ini seperti penghubung yang memudahkan akses ke semua model data dalam satu import.

3. Mengapa perlu variabel plan di langkah 6 pada praktikum tersebut? Mengapa dibuat konstanta ?

**Jawab:**

Variabel `plan` diperlukan sebagai **state** untuk menyimpan data rencana (plan) yang akan ditampilkan dan dikelola di `PlanScreen`. 

**Alasan perlu variabel plan:**
- **Menyimpan data**: Variabel ini menampung object Plan yang berisi list of tasks yang akan ditampilkan di UI
- **State management**: Karena `PlanScreen` adalah StatefulWidget, variabel plan ini adalah bagian dari state yang bisa berubah (misalnya saat user menambah/menghapus task)
- **Single source of truth**: Semua widget di dalam PlanScreen mengacu ke variabel plan yang sama, jadi datanya konsisten

**Mengapa dibuat konstanta (`const Plan()`):**
- **Nilai awal**: `const` di sini hanya untuk **inisialisasi awal** dengan Plan kosong (default constructor)
- **Bukan konstanta permanen**: Meskipun diinisialisasi dengan `const`, variabel `plan` sendiri **TIDAK** `final`, jadi nilainya masih bisa diubah nanti dengan `setState()`
- **Performance**: Menggunakan `const` untuk object yang immutable di awal bisa sedikit menghemat memori

**Contoh penggunaan nanti:**
```dart
// Variabel plan bisa diubah nilainya
setState(() {
  plan = Plan(name: 'New Plan', tasks: [...]);
});
```

Jadi, `const Plan()` hanya nilai awal sementara, bukan membuat variabel plan jadi konstanta permanen.

5. Apa kegunaan method pada Langkah 11 dan 13 dalam lifecyle state ?

**Jawab:**

**Langkah 11 - Method `initState()`:**

Method `initState()` adalah lifecycle method yang **dipanggil sekali** saat widget pertama kali dibuat (initialized).

**Kegunaan di praktikum:**
- **Inisialisasi ScrollController**: Membuat instance ScrollController yang akan mengontrol scrolling behavior
- **Menambahkan Listener**: `addListener()` untuk mendengarkan event scroll
- **Auto-dismiss keyboard**: Setiap kali user scroll, keyboard otomatis tertutup dengan `FocusScope.of(context).requestFocus(FocusNode())`
- **Timing yang tepat**: `initState()` dipanggil sebelum `build()`, jadi controller sudah siap saat UI di-render

**Urutan eksekusi:**
```
initState() → build() → Widget ditampilkan
```

---

**Langkah 13 - Method `dispose()`:**

Method `dispose()` adalah lifecycle method yang **dipanggil sekali** saat widget akan dihapus/dibuang dari widget tree.

**Kegunaan di praktikum:**
- **Cleanup resource**: Membebaskan memori yang digunakan oleh ScrollController
- **Mencegah memory leak**: Jika tidak di-dispose, ScrollController akan tetap ada di memori meskipun widget sudah tidak dipakai
- **Best practice**: Semua controller (ScrollController, TextEditingController, dll) harus di-dispose untuk menghindari memory leak
- **Memanggil super.dispose()**: Memastikan parent class juga melakukan cleanup

**Urutan eksekusi:**
```
Widget dihapus → dispose() dipanggil → Resource dibersihkan
```
## Praktikum 2 
Output:

![Praktikum2](img/Praktikum2.gif)

## Tugas Praktikum 2
2. Jelaskan mana yang dimaksud InheritedWidget pada langkah 1 tersebut! Mengapa yang digunakan InheritedNotifier?

**Jawab:**

Pada langkah 1, yang dimaksud **InheritedWidget** adalah class `InheritedNotifier<ValueNotifier<Plan>>` yang menjadi **parent class** dari `PlanProvider`.

```dart
class PlanProvider extends InheritedNotifier<ValueNotifier<Plan>> {
  // InheritedNotifier adalah subclass dari InheritedWidget
}
```

**Penjelasan:**
- `InheritedNotifier` adalah **turunan/subclass** dari `InheritedWidget`
- `PlanProvider` meng-extend `InheritedNotifier`, yang berarti secara tidak langsung juga meng-extend `InheritedWidget`
- Hierarki class: `PlanProvider` → `InheritedNotifier` → `InheritedWidget`

---

**Mengapa menggunakan InheritedNotifier (bukan InheritedWidget biasa)?**

**Alasan:**

1. **Auto rebuild dengan Listenable**:
   - `InheritedNotifier` sudah built-in support untuk `Listenable` (seperti `ValueNotifier`)
   - Widget yang subscribe otomatis rebuild saat `ValueNotifier.value` berubah
   - Tidak perlu implementasi manual `updateShouldNotify()`

2. **Lebih simpel dan efisien**:
   ```dart
   // Dengan InheritedNotifier - MUDAH
   class PlanProvider extends InheritedNotifier<ValueNotifier<Plan>> {
     // Sudah otomatis listen ke ValueNotifier
   }
   
   // Jika pakai InheritedWidget biasa - RIBET
   class PlanProvider extends InheritedWidget {
     final Plan plan;
     
     @override
     bool updateShouldNotify(PlanProvider old) {
       return plan != old.plan; // Harus manual cek
     }
   }
   ```

3. **Reactive programming**:
   - `ValueNotifier` adalah implementation dari `ChangeNotifier`
   - Saat `notifier.value` berubah, semua listener otomatis di-notify
   - Pattern yang lebih modern dan reactive

4. **Integration dengan ValueListenableBuilder**:
   - `InheritedNotifier` bekerja sempurna dengan `ValueListenableBuilder`
   - Kombinasi keduanya membuat state management yang powerful

**Kesimpulan:**
`InheritedNotifier` dipilih karena sudah menyediakan mekanisme otomatis untuk listen perubahan data melalui `ValueNotifier`, sehingga lebih simpel dan efisien daripada menggunakan `InheritedWidget` biasa yang harus manual mengatur kapan widget harus rebuild.

3. Jelaskan maksud dari method di langkah 3 pada praktikum tersebut! Mengapa dilakukan demikian?

**Jawab:**

**Method `completedCount`:**
```dart
int get completedCount => tasks
  .where((task) => task.complete)
  .length;
```

**Maksud:**
- **Menghitung jumlah task yang sudah selesai** (complete)
- Menggunakan `where()` untuk filter task yang `complete == true`
- Mengembalikan jumlah (`length`) task yang sudah di-check

**Contoh:**
Jika ada 5 task dan 3 sudah di-check, maka `completedCount = 3`

---

**Method `completenessMessage`:**
```dart
String get completenessMessage =>
  '$completedCount out of ${tasks.length} tasks';
```

**Maksud:**
- **Membuat pesan progress** dalam bentuk string
- Format: "X out of Y tasks" (misal: "3 out of 5 tasks")
- Menggunakan `completedCount` dan `tasks.length`

**Contoh output:**
- "0 out of 5 tasks" → belum ada yang selesai
- "3 out of 5 tasks" → 3 dari 5 task selesai
- "5 out of 5 tasks" → semua task selesai

---

**Mengapa dilakukan demikian?**

**Alasan:**

**Separation of Concerns**:
   - Logic perhitungan ada di **model** (Plan), bukan di **view** (Widget)
   - Model bertanggung jawab atas data dan logic bisnisnya sendiri
   - View hanya perlu memanggil `plan.completenessMessage`

**Reusability**:
   - Method ini bisa dipanggil dari mana saja yang punya object Plan
   - Tidak perlu duplikasi kode perhitungan di berbagai tempat
   - DRY principle (Don't Repeat Yourself)

**Reactive & Auto-update**:
   - Karena menggunakan **getter**, nilai otomatis recalculate setiap kali diakses
   - Tidak perlu manual update saat data tasks berubah
   - Kombinasi dengan `ValueListenableBuilder`, UI otomatis update

**Clean Code**:
   - Widget code lebih bersih: `Text(plan.completenessMessage)`
   - Mudah dibaca dan dipahami
   - Logic business terpisah dari UI logic

## Praktikum 3
Output:

![Praktikum3](img/Praktikum3.gif)

## Tugas Praktikum 3
2. Berdasarkan Praktikum 3 yang telah Anda lakukan, jelaskan maksud dari gambar diagram berikut ini!
![soal](img/soal.png)

**Jawab:**

Diagram tersebut menjelaskan **arsitektur State Management** menggunakan **InheritedNotifier** dan **Navigator** untuk multi-screen navigation dengan state yang ter-share.

**Penjelasan Detail Diagram:**

**1. MaterialApp sebagai Root Widget:**
- `MaterialApp` adalah root widget dari aplikasi Flutter
- Membungkus seluruh aplikasi dan menyediakan theming, routing, dll.

**2. PlanProvider (InheritedNotifier Layer):**
- **Posisi**: Membungkus MaterialApp, berada di level tertinggi widget tree
- **Fungsi**: Menyediakan **shared state** berupa `ValueNotifier<List<Plan>>` yang bisa diakses dari semua descendant widgets
- **Scope**: Semua widget di bawahnya (PlanCreatorScreen dan PlanScreen) bisa mengakses data plan yang sama
- **Pattern**: Menggunakan InheritedNotifier pattern untuk automatic rebuild saat data berubah

**3. Navigator (Route Management):**
- **Fungsi**: Mengelola stack navigasi antar screen
- **Lokasi**: Di dalam MaterialApp
- **Task**: Push/pop screen seperti PlanCreatorScreen dan PlanScreen

**4. PlanCreatorScreen (Home/First Screen):**
- **Fungsi**: 
  - Screen utama untuk **membuat plan baru**
  - Menampilkan **list semua plan** yang sudah dibuat
  - Navigasi ke PlanScreen saat plan di-tap
- **Akses State**: Mengambil dan memodifikasi `List<Plan>` melalui `PlanProvider.of(context)`
- **User Action**: 
  - Input nama plan → tambah plan baru ke list
  - Tap plan → navigate ke PlanScreen dengan `Navigator.push()`

**5. PlanScreen (Detail Screen):**
- **Fungsi**:
  - Screen detail untuk **mengelola tasks** dari plan tertentu
  - Menampilkan list tasks dengan checkbox
  - Menambah task baru
- **Parameter**: Menerima object `Plan` dari navigation
- **Akses State**: Mengambil dan memodifikasi plan spesifik di `List<Plan>` melalui `PlanProvider.of(context)`
- **User Action**:
  - Check/uncheck task
  - Edit task description
  - Tambah task baru
  - Back → kembali ke PlanCreatorScreen
  
**Kesimpulan:**

Diagram ini menggambarkan pattern **"Lift State Up"** dimana state di-lift ke level tertinggi (PlanProvider) sehingga bisa di-share oleh multiple screens. Navigator mengelola perpindahan antar screen, sementara InheritedNotifier memastikan semua screen selalu punya data terkini tanpa perlu manual passing atau callback. 