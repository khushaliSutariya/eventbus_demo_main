
class EmployeeModel {
  int id;
  String name;
  String email;
  int age;

  EmployeeModel({required this.id, required this.name,required this.email, required this.age});

  EmployeeModel copyWith({
    int? id,
    String? name,
    String? email,
    int? age,
  }) {
    return EmployeeModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      age: age ?? this.age,
    );
  }
}