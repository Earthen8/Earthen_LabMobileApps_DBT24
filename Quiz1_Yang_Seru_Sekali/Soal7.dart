void main() {
  List<int> a = [1, 5, 2, 52];
  List<int> b = [5, 6, 7, 9];

  List<int> merged = [...a, ...b];
  merged.sort();

  print('Result: $merged');
  print('Output: ${merged.last}');
}
