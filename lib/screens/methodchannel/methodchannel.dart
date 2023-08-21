import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MethodChannelScreens extends StatefulWidget {
  const MethodChannelScreens({Key? key}) : super(key: key);

  @override
  State<MethodChannelScreens> createState() => _MethodChannelScreensState();
}

class _MethodChannelScreensState extends State<MethodChannelScreens> {
  final String _responseFromNativeCode = 'Waiting for Response...';
  final MethodChannel _platform =
  const MethodChannel('cbl.tool.flutter_platform_channel');



  Future<void> _getDocuments() async {
    String msg = await _platform.invokeMethod('shakeHand');
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(msg),
        ),
      );}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Method Channel")),
      body: Column(
        children: [
          Text(_responseFromNativeCode),
          ElevatedButton(onPressed:_getDocuments, child: const Text("Method channel"))
        ],
      ),
    );
  }
}
