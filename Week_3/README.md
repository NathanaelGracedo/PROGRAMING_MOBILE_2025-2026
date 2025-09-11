# Laporan Praktikum Week 2

**Identitas Mahasiswa:**

| Nama | Kelas | NIM |
|------|-------|-----|
| Nathanael Juan Gracedo | TI-3H | 24 |

## **Praktikum 1**
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
**Output dari praktikum 1:**
**Output:** 
![image](img/Langkah1Prak1.png)
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

![image](img/Langkah3Prak1.png)

## **Praktikum 2**
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

## **Langkah 2**
**Output**

![image](img/Langkah1Prak2.png)
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
![image](img/Langkah1Prak2-success.png)

## **Langkah 3**
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
![image](img/Langkah3Prak2.png)