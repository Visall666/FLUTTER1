enum AccountStatus { ACTIVE, FROZEN, CLOSED }
class BankAccount {
  int accountId;
  String accountOwner;
  double balance;
  DateTime createdAt;
  AccountStatus status;

  BankAccount({
    required this.accountId,
    required this.accountOwner,
    this.balance = 0.0,
  })  : createdAt = DateTime.now(),
        status = AccountStatus.ACTIVE;

  double getBalance() {
    return balance;
  }


  void withdraw(double amount) {
    if (amount <= 0) {
      throw Exception('Invalid withdraw amount! Must be greater than zero.');
    }

    if (status != AccountStatus.ACTIVE) {
      throw Exception('Account is not active!');
    }

    if (balance - amount < 0) {
      throw Exception('Insufficient balance for withdrawal!');
    }

    balance -= amount;
  }

  void credit(double amount) {
    if (amount <= 0) {
      throw Exception('Invalid credit amount! Must be greater than zero.');
    }

    if (status != AccountStatus.ACTIVE) {
      throw Exception('Account is not active!');
    }

    balance += amount;
  }
}

class Bank {
  String name;
  final Map<int, BankAccount> _accounts = {};

  Bank({required this.name});
  
  BankAccount createAccount(int accountId, String accountOwner) {
    if (_accounts.containsKey(accountId)) {
      throw Exception('Account with ID $accountId already exists!');
    }

    var newAccount = BankAccount(
      accountId: accountId,
      accountOwner: accountOwner,
    );

    _accounts[accountId] = newAccount;
    return newAccount;
  }
}
 
void main() {

  Bank myBank = Bank(name: "CADT Bank");
  BankAccount ronanAccount = myBank.createAccount(100, 'Ronan');

  print(ronanAccount.getBalance()); // Balance: $0
  ronanAccount.credit(100);
  print(ronanAccount.balance); // Balance: $100
  ronanAccount.withdraw(50);
  print(ronanAccount.balance); // Balance: $50

  try {
    ronanAccount.withdraw(75); // This will throw an exception
  } catch (e) {
    print(e); // Output: Insufficient balance for withdrawal!
  }

  try {
    myBank.createAccount(100, 'Honlgy'); // This will throw an exception
  } catch (e) {
    print(e); // Output: Account with ID 100 already exists!
  }
}
