import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'plugin_one_method_channel.dart';

abstract class PluginOnePlatform extends PlatformInterface {
  /// Constructs a PluginOnePlatform.
  PluginOnePlatform() : super(token: _token);

  static final Object _token = Object();

  static PluginOnePlatform _instance = MethodChannelPluginOne();

  /// The default instance of [PluginOnePlatform] to use.
  ///
  /// Defaults to [MethodChannelPluginOne].
  static PluginOnePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PluginOnePlatform] when
  /// they register themselves.
  static set instance(PluginOnePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getCard() {
    throw UnimplementedError('getCard() has not been implemented.');
  }
}
