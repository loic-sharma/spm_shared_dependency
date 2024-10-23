import Flutter
import PlayingCard
import UIKit

public class PluginOnePlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "plugin_one", binaryMessenger: registrar.messenger())
    let instance = PluginOnePlugin()
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
