import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../main.dart';
import '../model/eventscreens.dart';

part 'eventdetail_state.dart';

class EventDetailCubit extends Cubit<EventDetailState> {
  EventDetailCubit() : super(EventDetailState( isFav: false));

  void addFavorite(String id) {
    emit(state.copyWith(isFav: !state.isFav));
    eventBus.fire(ProductListItemCreatedEvent(id: id, isFav: !state.isFav));
  }
}
