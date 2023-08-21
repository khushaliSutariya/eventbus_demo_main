import 'package:eventbus_demo_main/screens/sorting/model/employeemodel.dart';
import 'package:eventbus_demo_main/screens/sorting/sortdata_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SortDataScreens extends StatefulWidget {
  const SortDataScreens({Key? key}) : super(key: key);

  @override
  State<SortDataScreens> createState() => _SortDataScreensState();
}

class _SortDataScreensState extends State<SortDataScreens> {
   int index = 0;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => SortDataCubit(),
        child: BlocBuilder<SortDataCubit, SortDataState>(
          builder: (context, state) {
            return Scaffold(
                appBar: AppBar(title: const Text("Sorting Data"),
                ),
             body: Column(
               children: [
                 DropdownButtonFormField<int>(
                   decoration: const InputDecoration(labelText: 'age'),
                   hint: const Text("test"),
                   value: state.dropDownValue != null &&
                       (state.dropDownValue != 0 )
                       ? state.dropDownValue
                       : state.age.first,
                   items: state.age.map((int items) {
                     return DropdownMenuItem(
                       value: items,
                       child: Text(items.toString()),
                     );
                   }).toList(),
                   onChanged: (newValue) {
                     BlocProvider.of<SortDataCubit>(context)
                           .handleDropDown(newValue);
                   },

                 ),
                 Expanded(
                   child: ListView.builder(
                    itemCount: state.allEmployee.length,
                    itemBuilder: (context, index) {
                      var employee = state.allEmployee[index];
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
                                Text(employee.name.toString()),
                                Text(employee.email.toString()),
                                Text(employee.age.toString()),
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
      );

  }
}
