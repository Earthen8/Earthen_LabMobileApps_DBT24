class Account {
  int balance = 0;

  void deposit(int amount) {
    balance += amount;
  }

  void withdraw(int amount) {
    if (balance >= amount) {
      balance -= amount;
    } else {
      print('Insufficient balance');
    }
  }
}

void main() {
  Account myAccount = Account();

  myAccount.deposit(500);
  print('Balance after deposit: ${myAccount.balance}');

  myAccount.withdraw(200);
  print('Balance after withdraw: ${myAccount.balance}');

  myAccount.withdraw(1000);
  print('Balance after withdraw: ${myAccount.balance}');
}
