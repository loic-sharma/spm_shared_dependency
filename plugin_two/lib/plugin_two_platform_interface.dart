import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'plugin_two_method_channel.dart';

abstract class PluginTwoPlatform extends PlatformInterface {
  /// Constructs a PluginTwoPlatform.
  PluginTwoPlatform() : super(token: _token);

  static final Object _token = Object();

  static PluginTwoPlatform _instance = MethodChannelPluginTwo();

  /// The default instance of [PluginTwoPlatform] to use.
  ///
  /// Defaults to [MethodChannelPluginTwo].
  static PluginTwoPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PluginTwoPlatform] when
  /// they register themselves.
  static set instance(PluginTwoPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
