import 'package:eventbus_demo_main/screens/filter/filterdatascreens.dart';
import 'package:eventbus_demo_main/screens/visiblebutton/home/checkhomescreens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../sorting/sortdatascreens.dart';
import '../detail/eventdetailscreens.dart';
import '../model/eventscreens.dart';
import 'eventhomeview_cubit.dart';

class EventHomeScreens extends StatefulWidget {
  const EventHomeScreens({Key? key}) : super(key: key);

  @override
  State<EventHomeScreens> createState() => _EventHomeScreensState();
}

class _EventHomeScreensState extends State<EventHomeScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Event Bus"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const CheckHomeScreens(),
                ));
              },
              icon: const Icon(Icons.fact_check)),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SortDataScreens(),
                ));
              },
              icon: const Icon(Icons.sort_sharp)),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const FilterDataScreens(),
                ));
              },
              icon: const Icon(Icons.filter)),
        ],
      ),
      body: BlocProvider(
        create: (context) => EventHomeViewCubit(),
        child: BlocBuilder<EventHomeViewCubit, EventHomeViewState>(
          builder: (context, state) {
            return ListView.builder(
              itemCount: state.allProduct.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  child: ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => EventDetailScreens(
                            allDetail: state.allProduct[index],
                          ),
                        ));
                      },
                      title: Text(state.allProduct[index].title.toString()),
                      subtitle: Text(state.allProduct[index].detail.toString()),
                      trailing: IconButton(
                        onPressed: () {
                          context.read<EventHomeViewCubit>().addFavorite(index);
                        },
                        icon: Icon(state.allProduct[index].isFavorite ? Icons.favorite : Icons.favorite_border),
                      )),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
