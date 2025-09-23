// Langkah 1
// void main(List<String> args) {
//   var list = [1, 2, 3];
//   assert(list.length == 3);
//   assert(list[1] == 2);
//   print(list.length);
//   print(list[1]);

//   list[1] = 1;
//   assert(list[1] == 1);
//   print(list[1]);
// }

// Langkah 3
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
