part of 'checkhomeview_cubit.dart';



class CheckHomeViewState extends Equatable {
  final List<ListModel> allList;
  final bool isSelect;

  CheckHomeViewState({required this.allList,required this.isSelect});
  @override
  // TODO: implement props
  List<Object?> get props => [allList,isSelect];

  CheckHomeViewState copyWith({
    List<ListModel>? allList,
    bool? isSelect,
  }) {
    return CheckHomeViewState(
      allList: allList ?? this.allList,
      isSelect: isSelect ?? this.isSelect,
    );
  }
}
