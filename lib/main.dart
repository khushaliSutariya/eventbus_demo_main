import 'package:event_bus/event_bus.dart';
import 'package:eventbus_demo_main/screens/eventbus/home/eventhomescreens.dart';
import 'package:eventbus_demo_main/screens/methodchannel/methodchannel.dart';
import 'package:flutter/material.dart';

EventBus eventBus = EventBus();
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(
        primarySwatch: Colors.blue,
        radioTheme: RadioThemeData(
        fillColor: MaterialStateColor.resolveWith((states) => Colors.red),)),
    title: 'Flutter Demo',
      home:  const MethodChannelScreens(),
    );
  }
}


