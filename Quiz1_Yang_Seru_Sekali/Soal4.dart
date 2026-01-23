import 'dart:io';
import 'dart:math';

void main() {
  stdout.write('Enter a number: ');
  String? input = stdin.readLineSync();
  int? number = int.tryParse(input ?? '');

  if (number == null) {
    print('Please enter a valid integer.');
    return;
  }

  if (number <= 1) {
    print('$number is not a prime number.');
    return;
  }

  bool isPrime = true;
  for (int i = 2; i <= sqrt(number); i++) {
    if (number % i == 0) {
      isPrime = false;
      break;
    }
  }

  if (isPrime) {
    print('$number is a prime number.');
  } else {
    print('$number is not a prime number.');
  }
}
