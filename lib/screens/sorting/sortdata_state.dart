part of 'sortdata_cubit.dart';



class SortDataState extends Equatable {
   final List<EmployeeModel> allEmployee;
   final int dropDownValue;
   final List<int> age;
   const SortDataState({required this.age,required this.dropDownValue,required this.allEmployee});
  @override
  // TODO: implement props
  List<Object?> get props => [allEmployee,dropDownValue];

   SortDataState copyWith({
    List<EmployeeModel>? allEmployee,
    int? dropDownValue,
    List<int>? age,
  }) {
    return SortDataState(
      allEmployee: allEmployee ?? this.allEmployee,
      dropDownValue: dropDownValue ?? this.dropDownValue,
      age: age ?? this.age,
    );
  }
}
