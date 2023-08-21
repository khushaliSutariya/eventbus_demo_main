part of 'filter_data_cubit.dart';

// ignore: must_be_immutable
class FilterDataState extends Equatable {
  final List<EmployeeModel> allEmployee;
  final List<int> radioList;
  final int ageRadioValue;
  final List<EmployeeModel> newEmployeeList;
  final int salaryRadioValue;
  final String isActive;
  final List<int> age;
  final List<int> salary;
   const FilterDataState({required this.newEmployeeList,required this.isActive,required this.radioList,required this.ageRadioValue,required this.salaryRadioValue,required this.salary,required this.age,required this.allEmployee});

  @override
  // TODO: implement props
  List<Object?> get props => [newEmployeeList,isActive,radioList,age,ageRadioValue,salaryRadioValue,allEmployee,salary];

  FilterDataState copyWith({
    List<EmployeeModel>? allEmployee,
    List<int>? radioList,
    int? ageRadioValue,
    List<EmployeeModel>? newEmployeeList,
    int? salaryRadioValue,
    String? isActive,
    List<int>? age,
    List<int>? salary,
  }) {
    return FilterDataState(
      allEmployee: allEmployee ?? this.allEmployee,
      radioList: radioList ?? this.radioList,
      ageRadioValue: ageRadioValue ?? this.ageRadioValue,
      newEmployeeList: newEmployeeList ?? this.newEmployeeList,
      salaryRadioValue: salaryRadioValue ?? this.salaryRadioValue,
      isActive: isActive ?? this.isActive,
      age: age ?? this.age,
      salary: salary ?? this.salary,
    );
  }
}
