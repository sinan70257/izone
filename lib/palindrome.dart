void main() {
  int x = 1002001;
  String input = "$x";
  int max = input.length - 1;

  int min = 0;
  int flag = 0;

  while (min < max) {
    if (input[min] == input[max]) {
      min++;
      max--;
      flag = 0;
    } else {
      flag = 1;
      break;
    }
  }

  if (flag == 1) {
    print("false");
  } else {
    print("true");
  }
}
