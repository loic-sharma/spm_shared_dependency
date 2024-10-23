import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plugin_one/plugin_one.dart';
import 'package:plugin_two/plugin_two.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _card1 = 'Unknown';
  String _card2 = 'Unknown';
  final _pluginOnePlugin = PluginOne();
  final _pluginTwoPlugin = PluginTwo();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String card1;
    String card2;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      card1 =
          await _pluginOnePlugin.getCard() ?? 'Unknown card1';
    } on PlatformException {
      card1 = 'Failed to get card1.';
    }

    try {
      card2 =
          await _pluginTwoPlugin.getCard() ?? 'Unknown card2';
    } on PlatformException {
      card2 = 'Failed to get card2.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _card1 = card1;
      _card2 = card2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: [
            Text('Card 1: $_card1'),
            Text('Card 2: $_card2'),
          ],
        ),
      ),
    );
  }
}
