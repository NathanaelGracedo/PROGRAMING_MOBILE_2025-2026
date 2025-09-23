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
