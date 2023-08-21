import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/eventscreens.dart';
import '../model/productmodel.dart';
import 'eventdetail_cubit.dart';

class EventDetailScreens extends StatefulWidget {
  ProductModel allDetail;
  EventDetailScreens({Key? key, required this.allDetail}) : super(key: key);

  @override
  State<EventDetailScreens> createState() => _EventDetailScreensState();
}

class _EventDetailScreensState extends State<EventDetailScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Event Detail")),
      body: BlocProvider(
        create: (context) => EventDetailCubit(),
        child: BlocBuilder<EventDetailCubit, EventDetailState>(
          builder: (context, state) {
            bool isLike = widget.allDetail.isFavorite;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 4,
                    child: ListTile(
                      title: Text(widget.allDetail.title.toString()),
                      subtitle: Text(widget.allDetail.detail.toString()),
                      trailing: IconButton(
                          onPressed: () {
                            context.read<EventDetailCubit>().addFavorite(widget.allDetail.id);
                          },
                          icon: Icon(isLike == state.isFav ? Icons.favorite_border : Icons.favorite)),
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
