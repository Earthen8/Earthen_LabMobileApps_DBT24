import 'dart:io';
import 'dart:math';

void main() {
  Random random = Random();
  int answer = random.nextInt(100) + 1;
  int tries = 0;

  print('Guess the number between 1 and 100!');

  while (true) {
    stdout.write('Enter your guess: ');
    String? input = stdin.readLineSync();
    int? guess = int.tryParse(input ?? '');

    if (guess == null) {
      print('Please enter a valid number.');
      continue;
    }

    tries++;

    if (guess < answer) {
      print('Too small!');
    } else if (guess > answer) {
      print('Too big!');
    } else {
      print('Correct! You guessed it in $tries tries.');
      break;
    }
  }
}
