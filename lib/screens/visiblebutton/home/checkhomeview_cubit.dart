import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../model/listmodel.dart';

part 'checkhomeview_state.dart';

class CheckHomeViewCubit extends Cubit<CheckHomeViewState> {
  CheckHomeViewCubit()
      : super(CheckHomeViewState(isSelect: false, allList: [
          ListModel(id: 1, title: "Home", detail: "Home", value: false),
          ListModel(id: 2, title: "Contact", detail: "Contact", value: false),
          ListModel(id: 3, title: "Map", detail: "Map", value: false),
          ListModel(id: 4, title: "Phone", detail: "Phone", value: false),
          ListModel(id: 5, title: "Camera", detail: "Camera", value: false),
          ListModel(id: 6, title: "Setting", detail: "Setting", value: false),
          ListModel(id: 7, title: "Album", detail: "Album", value: false),
          ListModel(id: 8, title: "WiFi", detail: "WiFi", value: false),
          ListModel(id: 9, title: "Product", detail: "Product", value: false),
          ListModel(id: 10, title: "GPS", detail: "GPS", value: false),
        ]));

  void addCheckBox(bool? newValue, int index) {
    List<ListModel> list = List<ListModel>.from(state.allList);
    int length = list.where((element) => element.value).length;
    if (!newValue! || length < 3) {
      list[index] = list[index].copyWith(value: newValue);
      emit(state.copyWith(allList: list));
    }
    emit(state.copyWith(
      isSelect: length != 0,
    ));
  }
}
