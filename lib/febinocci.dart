void main(List<String> args) {
  List<int> arr = [1, 1, 1, 1];
  for (var i = 0; i < arr.length - 1; i++) {
    arr[i + 1] = arr[i] + arr[i + 1];
  }
  print(arr);
}
