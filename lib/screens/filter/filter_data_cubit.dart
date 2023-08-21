import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'model/employeemodel.dart';

part 'filter_data_state.dart';

class FilterDataCubit extends Cubit<FilterDataState> {
  FilterDataCubit()
      : super(FilterDataState(
            radioList: const [],
            ageRadioValue: 0,
            newEmployeeList: const [],
            salaryRadioValue: 0,
            age: const [10, 20, 30, 40, 50],
            salary: const [20000, 30000, 40000, 50000],
            isActive: "",
            allEmployee: [
              EmployeeModel(id: 1, name: "Khushali sutariya", email: "khushali123@gmail.com", age: 22, salary: 10000),
              EmployeeModel(id: 2, name: "mit vithani", email: "mit123@gmail.com", age: 20, salary: 50000),
              EmployeeModel(id: 3, name: "Nensi sutariya", email: "nensi456@gmail.com", age: 25, salary: 20000),
              EmployeeModel(id: 4, name: "Shruti nakrani", email: "Shruti526@gmail.com", age: 28, salary: 30000),
              EmployeeModel(id: 5, name: "Brijal sutariya", email: "Brijal521@gmail.com", age: 30, salary: 35000),
              EmployeeModel(id: 6, name: "Bhavik sutariya", email: "Bhavik528@gmail.com", age: 35, salary: 32000),
              EmployeeModel(id: 7, name: "Kuldeep ghori", email: "Kuldeep821@gmail.com", age: 25, salary: 23000),
              EmployeeModel(id: 8, name: "Mitesh mangukiya", email: "Mitesh324@gmail.com", age: 20, salary: 25000),
              EmployeeModel(id: 9, name: "Deep kothari", email: "Deep365@gmail.com", age: 50, salary: 45000),
              EmployeeModel(id: 10, name: "Rajan desai", email: "Rajan2154@gmail.com", age: 30, salary: 20000),
              EmployeeModel(id: 11, name: "Mital mahta", email: "Mitalmahta@gmail.com", age: 25, salary: 15000),
              EmployeeModel(id: 12, name: "Himani diyora", email: "Himani25511@gmail.com", age: 50, salary: 18000),
              EmployeeModel(
                  id: 13, name: "Sejal sutariya", email: "Sejalsutariya123@gmail.com", age: 28, salary: 43000),
              EmployeeModel(id: 14, name: "Shruti kikani", email: "Shrutikikani856@gmail.com", age: 32, salary: 41000),
              EmployeeModel(id: 15, name: "Dhruvi vaghasiya", email: "Dhruvi224@gmail.com", age: 35, salary: 10000),
              EmployeeModel(id: 16, name: "Janvi bhalala", email: "Janvi5454@gmail.com", age: 28, salary: 20000),
              EmployeeModel(id: 17, name: "Keyur patel", email: "Keyur54@gmail.com", age: 10, salary: 24000),
              EmployeeModel(id: 18, name: "Deep vora", email: "Deep55454@gmail.com", age: 20, salary: 23000),
              EmployeeModel(id: 19, name: "Nirav kakdiya", email: "Niravkakdiya@gmail.com", age: 30, salary: 25000),
              EmployeeModel(id: 20, name: "Jayesh vaghasiya", email: "Jayesh1545@gmail.com", age: 40, salary: 28000),
            ])) {
    onLoad();
  }

  void handleRadio(value) {
    if (state.isActive == "age") {
      emit(state.copyWith(ageRadioValue: value));
    } else if (state.isActive == "salary") {
      emit(state.copyWith(salaryRadioValue: value));
    }
  }

  void handleTab(value) {
    if (value == 'age') {
      emit(state.copyWith(radioList: state.age, isActive: value));
    } else {
      emit(state.copyWith(radioList: state.salary, isActive: value));
    }
  }

  void applyButton() {
    List<EmployeeModel> filterList = [];
    for (int i = 0; i < state.allEmployee.length; i++) {
      if (state.ageRadioValue != 0 && state.allEmployee[i].age >= state.ageRadioValue) {
         filterList.add(state.allEmployee[i]);
      }
      if (state.salaryRadioValue != 0 && state.allEmployee[i].salary >= state.salaryRadioValue) {

        filterList.add(state.allEmployee[i]);
      }
    }
    emit(state.copyWith(newEmployeeList: filterList));
  }


  void closeFilter() {
    emit(state.copyWith(newEmployeeList: state.allEmployee));
  }
  void onLoad() {
    emit(state.copyWith(radioList: state.age, isActive: "age",newEmployeeList: state.allEmployee));
  }

  void bottomSheet(BuildContext context) {
    showModalBottomSheet(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        context: context,
        builder: (context) {
          return BlocProvider.value(
            value: this,
            child: BlocBuilder<FilterDataCubit, FilterDataState>(
              builder: (context, state) {
                return SizedBox(
                  height: 600.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsetsDirectional.only(top: 10.0,start: 10.0,end: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Filters",style: TextStyle(fontWeight: FontWeight.w400),),
                            IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () {
                                Navigator.pop(context);
                                closeFilter();
                              },
                            ),
                          ],
                        ),
                      ),
                      const Divider(color: Colors.black45,  thickness: 2.0),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                InkWell(
                                    onTap: () {
                                      handleTab("age");
                                    },
                                    child: Container(
                                      height: 40.0,
                                        width: 150.0,
                                        padding: const EdgeInsetsDirectional.only(end: 10.0),
                                        color: Colors.grey.shade200,
                                        child: const Center(child: Text("Age")))),
                                const Divider(color: Colors.black, height: 2.0, thickness: 5.0),
                                InkWell(
                                    onTap: () {
                                      handleTab("salary");
                                    },
                                    child: Container(
                                        height: 40.0,
                                        width: 150.0,
                                        padding: const EdgeInsetsDirectional.only(end: 10.0),
                                        color: Colors.grey.shade200,
                                        child: const Center(child: Text("Salary")))),
                              ],
                            ),

                            Expanded(
                                child: Padding(
                              padding: const EdgeInsetsDirectional.only(start: 30.0),
                              child: ListView.builder(
                                itemCount: state.radioList.length,
                                physics: const NeverScrollableScrollPhysics(),
                                itemBuilder: (context, index) {
                                  return RadioListTile(
                                    activeColor: Colors.red,
                                    visualDensity: const VisualDensity(vertical: -4.0),
                                    contentPadding: EdgeInsets.zero,
                                    value: state.radioList[index],
                                    title: Text(state.radioList[index].toString()),
                                    groupValue:
                                        state.isActive == "age" ? state.ageRadioValue : state.salaryRadioValue,
                                    onChanged: (value) {
                                      handleRadio(value);
                                    },
                                  );
                                },
                              ),
                            ))
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                              child: Center(
                                  child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("Close"),
                          ))),
                          const VerticalDivider(width: 1.0),
                          Expanded(
                              child: Center(
                                  child: TextButton(
                            child: const Text("Apply"),
                            onPressed: () {
                              applyButton();
                              Navigator.pop(context);
                            },
                          ))),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        });
  }
}
