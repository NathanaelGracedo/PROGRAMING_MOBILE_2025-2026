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