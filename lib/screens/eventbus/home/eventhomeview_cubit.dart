import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../main.dart';
import '../model/eventscreens.dart';
import '../model/productmodel.dart';

part 'eventhomeview_state.dart';

class EventHomeViewCubit extends Cubit<EventHomeViewState> {
  EventHomeViewCubit()
      : super(EventHomeViewState(
          allProduct: [
            ProductModel(title: "shoes", id: "1", detail: "nike", isFavorite: false),
            ProductModel(title: "dress", id: "2", detail: "one piece", isFavorite: false),
            ProductModel(title: "watch", id: "3", detail: "smart watch", isFavorite: false),
            ProductModel(title: "vegetables", id: "4", detail: "tomato", isFavorite: false),
            ProductModel(title: "snacks", id: "5", detail: "instant idli", isFavorite: false),
            ProductModel(title: "personal care", id: "6", detail: "dove", isFavorite: false),
          ],
        )){listenLike();}

  void addFavorite(int index) {
    List<ProductModel> list = List<ProductModel>.from(state.allProduct);
    list[index] = list[index].copyWith(isFavorite: !list[index].isFavorite);
    emit(state.copyWith(allProduct: list));
  }
  void listenLike(){
   eventBus.on<ProductListItemCreatedEvent>().listen((event) {
      List<ProductModel> temp = List.from(state.allProduct);
      int index = temp.indexWhere((element) => element.id == event.id);
      addFavorite(index);
    });
  }
}
