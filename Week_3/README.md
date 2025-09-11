# **Laporan Praktikum Week 3**

**Identitas Mahasiswa:**

| Nama | Kelas | Absen |
|------|-------|-----|
| Nathanael Juan Gracedo | TI-3H | 24 |

## **Praktikum 1: Menerapkan Control Flows ("if/else")**
### **Langkah 1**
**Kode Program:**
~~~Dart
void main(List<String> args) {
  String test = "test2";
  if (test == "test1") {
    print("Test1");
  } else if (test == "test2") {
    print("Test2");
  } else {
    print("Something else");
  }

  if (test == "test2") {
    print("Test2 again");
  }
}
~~~


### **Langkah 2**
**Output dari Langkah 1:**
**Output:** 
![image](img/Prak1Langkah1.png)
**Penjelasan:**
Output print test bernilai "test2". Karena kondisi else if pertama dan kondisi if kedua keduanya bernilai benar. Akibatnya, program akan menjalankan kedua perintah print dan menghasilkan output "Test2" diikuti "Test2 again".

### **Langkah 3**
**Kode sebelum dibenahi:**
~~~Dart
String test = "true";
if (test) {
   print("Kebenaran");
}
~~~
**Kode setelah saya benahi:**
 ~~~Dart
 String test1 = "true";
  if (test1 == "true") {
    print("kebenaran");
}
~~~

**Output:** 

![image](img/Prak1Langkah3.png)

## **Praktikum 2: Menerapkan Perulangan "while" dan "do-while"**
### **Langkah 1**
**Kode sebelum diperbaiki**
~~~dart
void main(List<String> args) {
  while (counter < 7) {
    print(counter);
    counter++;
  }
}
~~~

### **Langkah 2**
**Output**

![image](img/Prak2Langkah1.png)
**Penjelasan:**
Akan terjadi error saat menjalankan program karena variabel "counter" belum dideklarasikan, sehingga komputer tidak bisa menemukan variabel counter.

**Kode setelah saya benahi**
~~~Dart
void main(List<String> args) {
  int counter = 7;
  while (counter < 12) {
    print(counter);
    counter++;
  }
}
~~~

**Output**
![image](img/Prak2-successLangkah1.png)

### **Langkah 3**
**Kode Program:**
~~~Dart
void main(List<String> args) {
  //Langkah 1
  int counter = 7;
  while (counter < 12) {
    print(counter);
    counter++;
  }

  //Langkah 3
  do {
    print(counter);
    counter++;
  } while (counter < 15);
}
~~~

**Output:**
![image](img/Prak2Langkah3.png)

## **Praktikum 3: Menerapkan Perulangan "for" dan "break-continue"**
### **Langkah 1**
**Kode program**
~~~Dart
void main(List<String> args) {
  for (Index = 10; index < 27; index) {
    print(Index);
  }
}
~~~

### **Langkah 2**
**Output pada kode langkah 1:**
![image](img/Prak3-errorLangkah1.png)
**Penjelasan:**
Akan terjadi error saat program dijalankan karena variable index tidak konsisten pengetikannya, ada "Index" dan "index".  

**Kode setelah saya perbaiki:**
~~~Dart
void main(List<String> args) {
  for (int Index = 10; Index < 27; Index) {
    print(Index);
  }
}
~~~

### **Langkah 3**
**Kode program error**
~~~Dart
If (Index == 21) break;
Else If (index > 1 || index < 7) continue;
print(index);
~~~
**Penjelasan:** Kode error karena struktur syntax yang tidak sesuai, dan penamaan variable index yang tidak sesuai.

**Kode program setelah saya benahi**
~~~Dart
void main(List<String> args) {
  //Langkah 1
  for (int Index = 10; Index < 27; Index++) {
    print(Index);
    //Langkah 3
    if (Index == 21)
      break;
    else if (Index > 1 || Index < 7)
      continue;
    print(Index);
  }
}
~~~

**Output**
![image](img/Prak3Langkah3.png)

## Tugas Praktikum
Buatlah sebuah program yang dapat menampilkan bilangan prima dari angka 0 sampai 201 menggunakan Dart. Ketika bilangan prima ditemukan, maka tampilkan nama lengkap dan NIM Anda

**Kode Program:**
~~~Dart
void main() {
  for (int i = 0; i <= 201; i++) {
    if (isPrime(i)) {
      print("$i adalah bilangan prima");
      print("Nathanael Juan Gracedo");
      print("2341720217");
    } else {
      print("$i bukan bilangan prima");
    }
  }
}

bool isPrime(int num) {
  if (num < 2) return false;
  for (int i = 2; i <= num ~/ 2; i++) {
    if (num % i == 0) {
      return false;
    }
  }
  return true;
}
~~~

**Output:**
![alt text](img/TugasPraktikum.png)