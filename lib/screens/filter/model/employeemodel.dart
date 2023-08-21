class EmployeeModel {
  int id;
  String name;
  String email;
  int age;
  int salary;

  EmployeeModel(
      {required this.salary,
      required this.id,
      required this.name,
      required this.email,
      required this.age});

  EmployeeModel copyWith({
    int? id,
    String? name,
    String? email,
    int? age,
    int? salary,
  }) {
    return EmployeeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      age: age ?? this.age,
      salary: salary ?? this.salary,
    );
  }
}
// void applyButton() {
//   if (state.isActive == "age") {
//     final filterAge = state.allEmployee.where((element) {
//       return element.age >= state.ageRadioValue;
//     }).toList();
//     emit(state.copyWith(newEmployeeList: filterAge));
//   } else if (state.isActive == "salary") {
//     final filterSalary = state.allEmployee.where((element) {
//       return element.salary >= state.salaryRadioValue;
//     }).toList();
//     emit(state.copyWith(newEmployeeList: filterSalary));
//   }
// }