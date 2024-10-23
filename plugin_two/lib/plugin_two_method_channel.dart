import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'plugin_two_platform_interface.dart';

/// An implementation of [PluginTwoPlatform] that uses method channels.
class MethodChannelPluginTwo extends PluginTwoPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('plugin_two');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
