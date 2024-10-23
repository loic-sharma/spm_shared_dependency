
import 'plugin_two_platform_interface.dart';

class PluginTwo {
  Future<String?> getCard() {
    return PluginTwoPlatform.instance.getCard();
  }
}
