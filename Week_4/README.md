# **Laporan Praktikum Week 4**

**Identitas Mahasiswa:**

| Nama | Kelas | Absen |
|------|-------|-----|
| Nathanael Juan Gracedo | TI-3H | 24 |

## **Praktikum 1: Eksperimen Tipe Data List**
### **Langkah 1**
**Kode Program:**
~~~Dart
void main(List<String> args) {
  var list = [1, 2, 3];
  assert(list.length == 3);
  assert(list[1] == 2);
  print(list.length);
  print(list[1]);

  list[1] = 1;
  assert(list[1] == 1);
  print(list[1]);
}
~~~

### **Langkah 2**
**Output:**
![img](img/Prak1Lang1.png)
**Deskripsi**: Setelah di jalankan program akan menginisialisasi sebuah list dengan tiga angga: 1, 2, dan 3. Program awalnya hanya mencetak panjang list yaitu 3 dan nilai pada indeks ke-1 yaitu 2. Kemudian nilai pada indeks ke-1 diubah menjadi 1. Terakhir, program akan mencetak kembali nilai pada indeks ke-1 yang sudah diperbarui, sehingga output terakhirnya adalah 1. Perintah 'assert' digunakan untuk memverifikasi kondisi. 

### **Langkah 3**
Mengubah kode pada langkah 1 menjadi variabel final yang mempunyai index = 5 dengan default value = null. Mengisi dengan nama dan NIM saya pada elemen index ke-1 dan ke-2. Lalu print dan capture hasilnya.

**Kode Program:**
~~~Dart
void main(List<String> args) {
  final list = List<Object?>.filled(5, null);
  list[1] = 'Nathanael Juan Gracedo';
  list[2] = '2341720217';

  assert(list.length == 5);
  assert(list[1] == 'Nathanael Juan Gracedo');
  assert(list[2] == '2341720217');

  print(list[1]);
  print(list[2]);
}
~~~

**Output:**
![img](img/Prak1Lang3.png)
**Deskripsi:** Program akan menampilkan list indeks ke-1 yaitu "Nathanael Juan Gracedo" dan indeks ke-2 yaitu "2341720217".

## **Praktikum 2: Eksperimen Tipe Data Set**
### **Langkah 1**
**Kode Program:**
~~~Dart
void main(List<String> args) {
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  print(halogens);
}
~~~

### **Langkah 2**
**Output**
![img](img/Prak2Lang1.png)
**Deskripsi:** Output yang muncul saat program dijalankan adalah string data set yaitu "{'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'}"

## **Langkah 3**
**Kode Program:**
~~~Dart
void main(List<String> args) {
  var names1 = <String>{};
  Set<String> names2 = {};
  var names3 = {};

  print(names1);
  print(names2);
  print(names3);
}
~~~

**Output:**
![img](img/Prak2Lang3.png)
**Deskripsi:** Program tidak mengalami error namun hanya menampilkan object kosong atau null.

**Kode setelah saya ubah:**
~~~Dart
void main(List<String> args) {
  var names1 = <String>{};
  Set<String> names2 = {};
  var names3 = {};

  names1.add('Nathanael Juan Gracedo');
  names1.add('2341720217');

  names2.addAll(['Nathanael Juan Gracedo', '2341720217']);

  print(names1);
  print(names2);
  print(names3);
}
~~~

**Output:**
![img](img/Prak2Lang3Modify.png)

## **Praktikum 3: Eksperimen Tipe Data Maps**
### **Langkah 1**
**Kode Program:**
~~~Dart
void main(List<String> args) {
  var gifts = {
    // Key: Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 1,
  };

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 2,
  };

  print(gifts);
  print(nobleGases);
}
~~~

### **Langkah 2**
**Output:**
![img](img/Prak3Lang2.png)
**Deskripsi:** Program akan memunculkan output dari var gifts dan var nobleGases.

### **Langkah 3**
**Kode Program**
~~~Dart
void main(List<String> args) {
  var gifts = {
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 'golden rings',
  };

  var nobleGases = {2: 'helium', 10: 'neon', 18: 'argon'};

  var mhs1 = Map<String, String>();
  gifts['nama'] = 'Nathanael Juan Gracedo';
  gifts['nim'] = '2341720217';

  var mhs2 = Map<int, String>();
  nobleGases[1] = 'Nathanael Juan Gracedo';
  nobleGases[3] = '2341720217';

  mhs1['nama'] = 'Nathanael Juan Gracedo';
  mhs1['nim'] = '2341720217';

  mhs2[1] = 'Nathanael Juan Gracedo';
  mhs2[3] = '2341720217';

  print(gifts);
  print(nobleGases);
  print(mhs1);
  print(mhs2);
}
~~~

**Output:**
![img](img/Prak3Lang3.png)
**Deskripsi:** Saya sudah menambahkan nama dan NIM saya pada var gifts, nobleGases, mhs1, dan mhs2. Program akan memunculkan isi dari masing masing variable yang sudah di deklarasikan.