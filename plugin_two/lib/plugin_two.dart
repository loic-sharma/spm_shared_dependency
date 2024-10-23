
import 'plugin_two_platform_interface.dart';

class PluginTwo {
  Future<String?> getPlatformVersion() {
    return PluginTwoPlatform.instance.getPlatformVersion();
  }
}
