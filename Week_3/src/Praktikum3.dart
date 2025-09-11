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
