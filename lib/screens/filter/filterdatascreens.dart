import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'filter_data_cubit.dart';

class FilterDataScreens extends StatefulWidget {
  const FilterDataScreens({Key? key}) : super(key: key);

  @override
  State<FilterDataScreens> createState() => _FilterDataScreensState();
}

class _FilterDataScreensState extends State<FilterDataScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Employee List")),
      body: BlocProvider(
        create: (context) => FilterDataCubit(),
        child: BlocBuilder<FilterDataCubit, FilterDataState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                    width: 100.0,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: ElevatedButton(
                          onPressed: () {
                            context.read<FilterDataCubit>().bottomSheet(context);
                          },
                          style: ElevatedButton.styleFrom(
                              primary: Colors.white,
                              side: const BorderSide(width: 2, color: Colors.red),
                              elevation: 3,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                              padding: const EdgeInsets.all(20)),
                          child: const Text("filter",style: TextStyle(color: Colors.red),)),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.newEmployeeList.length,
                      itemBuilder: (context, index) {
                        var employee = state.newEmployeeList[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            elevation: 4,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Employee name:- ${employee.name.toString()}"),
                                  Text("Employee email:- ${employee.email.toString()}"),
                                  Text("Employee salary:- ${employee.salary.toString()}"),
                                  Text("Employee age:- ${employee.age.toString()}"),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
