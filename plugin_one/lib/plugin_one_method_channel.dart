import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'plugin_one_platform_interface.dart';

/// An implementation of [PluginOnePlatform] that uses method channels.
class MethodChannelPluginOne extends PluginOnePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('plugin_one');

  @override
  Future<String?> getCard() async {
    final card = await methodChannel.invokeMethod<String>('getCard');
    return card;
  }
}
