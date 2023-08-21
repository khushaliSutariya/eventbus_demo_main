

class ProductListItemCreatedEvent {
  final bool isFav;
  final String id;
  ProductListItemCreatedEvent({required this.id,required this.isFav});
}



// void addFavorite(bool isFav, int index) {
//   state.allProduct.elementAt(index).isFavorite = !state.allProduct.elementAt(index).isFavorite;
//   print("=====${state.allProduct.elementAt(index).isFavorite}");
//   emit(state.copyWith(allProduct: state.allProduct));
//   state.eventBus.fire(ProductListItemCreatedEvent(state.allProduct.elementAt(index).id, isFav));
// }

// void addFavorite(bool isFav,int index,List list) {
//   // var index = state.allProduct.firstWhere((element) => element.id == id);
//   // index.isFavorite = !index.isFavorite;
//   // print("=====${state.allProduct.firstWhere((element) => element.id == id).isFavorite}");
//   List<ProductModel>? data = List.from(list)..[index].isFavorite = !isFav;
//   List<ProductModel>? tempdata = data.where((element) => element.isFavorite == true).toList();
//   state.allProduct.forEach((element) {
//   print("data=======${element.isFavorite == true}");
//   });
//   emit(state.copyWith(selectProduct:  tempdata));
//   // state.eventBus.fire(ProductListItemCreatedEvent(id,isFav));
// }