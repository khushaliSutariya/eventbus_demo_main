
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'checkhomeview_cubit.dart';

class CheckHomeScreens extends StatefulWidget {
  const CheckHomeScreens({Key? key}) : super(key: key);

  @override
  State<CheckHomeScreens> createState() => _CheckHomeScreensState();
}

class _CheckHomeScreensState extends State<CheckHomeScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("CheckBox with visible button")),
      body: BlocProvider(
        create: (context) => CheckHomeViewCubit(),
        child: BlocBuilder<CheckHomeViewCubit, CheckHomeViewState>(
          builder: (context, state) {
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: state.allList.length,
                    itemBuilder: (context, index) {
                      var list = state.allList[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsetsDirectional.only(start: 8.0,end: 8.0),
                          child: CheckboxListTile(
                            title: Text(list.title.toString()),
                            subtitle: Text(list.detail.toString()),
                            contentPadding: const EdgeInsets.all(0),
                            value: list.value,
                            onChanged: (newValue) {
                                context.read<CheckHomeViewCubit>().addCheckBox(newValue,index);
                                },
                          ),
                        ),
                      ),
                    );
                  },),
                ),
                ElevatedButton(onPressed: state.isSelect
                    ?(){}:null, child: const Text("Submit"))
              ],
            );
          },
        ),
      ),
    );
  }
}
