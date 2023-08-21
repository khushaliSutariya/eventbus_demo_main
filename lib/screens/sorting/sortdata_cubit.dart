import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import 'model/employeemodel.dart';

part 'sortdata_state.dart';

class SortDataCubit extends Cubit<SortDataState> {
  SortDataCubit()
      : super(SortDataState(
            dropDownValue: 0,
            age: const [
              10,
              20,
              30,
              40,
              50,
            ],
            allEmployee: [
              EmployeeModel(id: 1, name: "Khushali sutariya", email: "khushali123@gmail.com", age: 10),
              EmployeeModel(id: 2, name: "mit vithani", email: "mit123@gmail.com", age: 20),
              EmployeeModel(id: 3, name: "Nensi sutariya", email: "nensi456@gmail.com", age: 25),
              EmployeeModel(id: 4, name: "Shruti nakrani", email: "Shruti526@gmail.com", age: 28),
              EmployeeModel(id: 5, name: "Brijal sutariya", email: "Brijal521@gmail.com", age: 30),
              EmployeeModel(id: 6, name: "Bhavik sutariya", email: "Bhavik528@gmail.com", age: 35),
              EmployeeModel(id: 7, name: "Kuldeep ghori", email: "Kuldeep821@gmail.com", age: 25),
              EmployeeModel(id: 8, name: "Mitesh mangukiya", email: "Mitesh324@gmail.com", age: 20),
              EmployeeModel(id: 9, name: "Deep kothari", email: "Deep365@gmail.com", age: 50),
              EmployeeModel(id: 10, name: "Rajan desai", email: "Rajan2154@gmail.com", age: 30),
              EmployeeModel(id: 11, name: "Mital mahta", email: "Mitalmahta@gmail.com", age: 25),
              EmployeeModel(id: 12, name: "Himani diyora", email: "Himani25511@gmail.com", age: 50),
              EmployeeModel(id: 13, name: "Sejal sutariya", email: "Sejalsutariya123@gmail.com", age: 28),
              EmployeeModel(id: 14, name: "Shruti kikani", email: "Shrutikikani856@gmail.com", age: 32),
              EmployeeModel(id: 15, name: "Dhruvi vaghasiya", email: "Dhruvi224@gmail.com", age: 35),
              EmployeeModel(id: 16, name: "Janvi bhalala", email: "Janvi5454@gmail.com", age: 28),
              EmployeeModel(id: 17, name: "Keyur patel", email: "Keyur54@gmail.com", age: 10),
              EmployeeModel(id: 18, name: "Deep vora", email: "Deep55454@gmail.com", age: 20),
              EmployeeModel(id: 19, name: "Nirav kakdiya", email: "Niravkakdiya@gmail.com", age: 30),
              EmployeeModel(id: 20, name: "Jayesh vaghasiya", email: "Jayesh1545@gmail.com", age: 40),
            ]));

  void handleDropDown(value) {
    final filteredList = state.allEmployee.where((item) => item.age >= value).toList();
    emit(state.copyWith(dropDownValue: value,allEmployee: filteredList));
  }


}
