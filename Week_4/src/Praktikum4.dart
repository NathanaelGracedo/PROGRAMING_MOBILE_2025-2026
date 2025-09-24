void main(List<String> args) {
  var list = [1, 2, 3];
  var list2 = [0, ...list];
  print('list: $list');
  print('list2: $list2');
  print('Panjang list2: ${list2.length}');

  var list1 = [1, 2, null];
  print('list1: $list1');
  var list3 = [0, ...list1];
  print('list3 (setelah spread): $list3');
  print('Panjang list3: ${list3.length}');
  var nim = ['2', '3', '4', '1', '7', '2', '0', '2', '1', '7'];
  var nimSpread = [...nim];
  print('NIM: $nim');
  print('NIM (setelah di-spread): $nimSpread');

  // Skenario 1: promoActive = false
  bool promoActive = false;
  var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  print('Hasil jika promoActive false: $nav');

  // Skenario 2: promoActive = true
  promoActive = true;
  nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  print('Hasil jika promoActive true: $nav');

  
  String login;
  // Kondisi 1: login = 'Manager'
  login = 'Manager';
  var nav2 = [
    'Home',
    'Furniture',
    'Plants',
    if (login == 'Manager') 'Inventory',
  ];
  print("Hasil jika login = 'Manager': $nav2");

  // Kondisi 2: login = 'User'
  login = 'User';
  nav2 = ['Home', 'Furniture', 'Plants', if (login == 'Manager') 'Inventory'];
  print("Hasil jika login = 'User': $nav2");

  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  assert(listOfStrings[1] == '#1');
  print(listOfStrings);
}
