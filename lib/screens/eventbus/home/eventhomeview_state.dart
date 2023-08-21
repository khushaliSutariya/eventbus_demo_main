part of 'eventhomeview_cubit.dart';



class EventHomeViewState extends Equatable {
  List<ProductModel> allProduct = [];
  EventHomeViewState({required this.allProduct,});
  @override
  // TODO: implement props
  List<Object?> get props => [allProduct];

  EventHomeViewState copyWith({
    List<ProductModel>? allProduct,
  }) {
    return EventHomeViewState(
      allProduct: allProduct ?? this.allProduct,
    );
  }
}
