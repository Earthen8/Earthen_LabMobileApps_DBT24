import 'dart:io';
import 'dart:math';

void main() {
  print('Rock, Paper, Scissors Game');

  while (true) {
    stdout.write('Choose (r)ock, (p)aper, (s)cissors or (q)uit: ');
    String? input = stdin.readLineSync()?.toLowerCase();

    if (input == 'q') {
      break;
    }

    if (input != 'r' && input != 'p' && input != 's') {
      print('Invalid input. Try again.');
      continue;
    }

    List<String> options = ['rock', 'paper', 'scissors'];
    String userChoice = input == 'r'
        ? 'rock'
        : (input == 'p' ? 'paper' : 'scissors');

    Random rng = Random();
    String cpuChoice = options[rng.nextInt(options.length)];

    print('You: $userChoice');
    print('Computer: $cpuChoice');

    if (userChoice == cpuChoice) {
      print("It's a Draw!");
    } else if ((userChoice == 'rock' && cpuChoice == 'scissors') ||
        (userChoice == 'paper' && cpuChoice == 'rock') ||
        (userChoice == 'scissors' && cpuChoice == 'paper')) {
      print('You Win!');
    } else {
      print('Computer Wins!');
    }
    print('');
  }
}
