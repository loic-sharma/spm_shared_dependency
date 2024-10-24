import Flutter
import PlayingCard
import UIKit

public class PluginTwoPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "plugin_two", binaryMessenger: registrar.messenger())
    let instance = PluginTwoPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getCard":
      result(PlayingCard(rank: .queen, suit: .diamonds).description)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
