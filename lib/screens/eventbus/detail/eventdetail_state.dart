part of 'eventdetail_cubit.dart';

class EventDetailState extends Equatable {
  bool isFav;


  EventDetailState({ required this.isFav});

  @override
  // TODO: implement props
  List<Object?> get props => [
        isFav,
      ];

  EventDetailState copyWith({
    bool? isFav,
  }) {
    return EventDetailState(
      isFav: isFav ?? this.isFav,
    );
  }
}
