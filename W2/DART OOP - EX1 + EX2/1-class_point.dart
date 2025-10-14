enum Skill { FLUTTER, DART, OTHER }

class Employee {
  String _name;
  double _baseSalary;
  List<Skill> _skills;
  Address _address;
  int _yearsOfExperience;

  Employee(
    this._name, 
    this._baseSalary, {
      required List<Skill> skills,
      required Address address,
      required int yearsOfExperience
    }
  ) : _skills = skills,
      _address = address,
      _yearsOfExperience = yearsOfExperience;

  // Named constructor for a Mobile Developer
  Employee.mobileDeveloper(
    String name,
    double baseSalary,
    Address address, {
      int yearsOfExperience = 0,
    }
  ) : _name = name,
      _baseSalary = baseSalary,
      _skills = [Skill.FLUTTER, Skill.DART],
      _address = address,
      _yearsOfExperience = yearsOfExperience;

  // Getter
  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  // Method to compute salary
  double computeSalary() {
    double salary = 40000; // base salary
    salary += _yearsOfExperience * 2000;

    for (var skill in _skills) {
      switch (skill) {
        case Skill.FLUTTER:
          salary += 5000;
          break;
        case Skill.DART:
          salary += 3000;
          break;
        case Skill.OTHER:
          salary += 1000;
          break;
      }
    }

    return salary;
  }


  void printDetails() {
    final skillList = skills.map((s) => s.name).join(', ');
    print('Employee: $_name');
    print('  Base Salary: \$${_baseSalary}');
    print('  Skills: $skillList');
    print('  Address: $_address');
    print('  Years of Experience: $_yearsOfExperience');
    print('  Computed Salary: \$${computeSalary()}');
    print('------------------------------------');
  }
}

class Address {
  final String street;
  final String city;
  final String zipCode;

  const Address(
    this.street,
    this.city,
    this.zipCode
  );
  
  @override
  String toString() => '$street, $city $zipCode';
}

void main() {
  //Regular employee
  var emp1 = Employee(
    'Sokea', 40000,
    skills: [Skill.DART, Skill.OTHER],
    address: Address('178 toul', 'PhnomPenh', '12000'),
    yearsOfExperience: 2,
  );
  emp1.printDetails();

  // Mobile developer
  var emp2 = Employee.mobileDeveloper(
    'Ronan', 45000,
    Address('12 Samk', 'Phnom Penh', '12000'),
    yearsOfExperience: 5,
  );
  emp2.printDetails();
}
